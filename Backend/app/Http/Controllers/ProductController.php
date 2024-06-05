<?php

namespace App\Http\Controllers;

use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;



class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Product::with('category', 'images')->paginate(8);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'price' => 'required|numeric',
                'category_id' => 'required|exists:categories,id',
                'images.*' => 'required|image|max:2048',
                'description' => 'required|string',
                'usage' => 'required|string',
                'quantity' => 'required|numeric',
            ]);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }

        // Check if there are images
    if (!$request->hasFile('images') || count($request->file('images')) === 0) {
        return response()->json(['error' => 'At least one image is required'], 400);
    }
        // Create the product 
    $product = Product::create([
        'name' => $validatedData['name'],
        'price' => $validatedData['price'],
        'category_id' => $validatedData['category_id'],
        'description' => $validatedData['description'],
        'usage' => $validatedData['usage'],
        'quantity' => $validatedData['quantity'],
    ]);

    // Handle image upload
    foreach ($request->file('images') as $image) {
        $imagePath = Storage::disk('s3')->putFile('product_images', $image, 'public');
        
        // Save each image path in the images table
        $product->images()->create([
            'image_url' => $imagePath,
        ]);
    }

    return response()->json($product->load('images'), 201);
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::with('category', 'images')->findOrFail($id); 
        return response()->json($product);
    }

    
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
        $product = Product::findOrFail($id);
        $images = $product->images;

       // Delete each image from S3 bucket and the database
        foreach ($images as $image) {
            if (Storage::disk('s3')->exists($image->image_url)) {
                Storage::disk('s3')->delete($image->image_url);
            }
            $image->delete();
        }

        $product->delete();

        return response()->json(['message' => 'Product and its images deleted successfully'], 200);
    }

    public function updateProduct(Request $request,$id)
    {
        try {
           
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'price' => 'required|numeric',
                'category_id' => 'required|exists:categories,id',
                'description' => 'required|string',
                'usage' => 'required|string',
                'quantity' => 'required|numeric',
                'delete_images' => 'sometimes|array', // array of image IDs to delete
                'delete_images.*' => 'integer|exists:images,id',
                'images' => 'sometimes|array',
                'images.*' => 'image|max:2048', // each image file
            ]);
    
            
            $product = Product::findOrFail($id);
    
            // Update the product attributes
            $product->fill($validatedData);
            $product->save();
    
            // Handle image deletion if specified
            if ($request->has('delete_images') && is_array($request->input('delete_images'))) {
                $imagesToDelete = $request->input('delete_images');
                $imagesToDeleteString = implode(', ', $imagesToDelete);
                
    
                foreach ($imagesToDelete as $imageId) {
                    $image = $product->images()->find($imageId);
                    if ($image) {
                        if (Storage::disk('s3')->exists($image->image_url)) {
                            Storage::disk('s3')->delete($image->image_url);
                        }
                        $image->delete();
                    }
                }
            }
    
            // Handle image upload if new images are provided
            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $imageFile) {
                    $imagePath = Storage::disk('s3')->putFile('product_images', $imageFile, 'public');
                    
    
                    // Save each image path in the images table
                    $product->images()->create([
                        'image_url' => $imagePath,
                    ]);
                }
            }
    
            return response()->json($product->load('images'), Response::HTTP_OK);
        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validation error: ' . $e->getMessage(),
                'errors' => $e->errors(),
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'An unexpected error occurred: ' . $e->getMessage(),
            ], 500);
        }
    }
}
