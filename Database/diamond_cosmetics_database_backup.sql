-- MySQL dump 10.13  Distrib 8.0.11, for macos10.13 (x86_64)
--
-- Host: localhost    Database: diamond_cosmetics
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'2024-06-04 07:41:11','2024-06-04 07:41:11','Face'),(2,'2024-06-04 07:41:24','2024-06-04 07:41:24','Lips'),(3,'2024-06-04 07:41:30','2024-06-04 07:41:30','Eyes');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `images_product_id_foreign` (`product_id`),
  CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'product_images/qWJhRGp8nmQbrn9dMTJRufIHnyMuIzLRpPk4cmPl.jpeg','2024-06-04 07:56:35','2024-06-04 07:56:35',1),(2,'product_images/PLFKuXnoQo47yyF3w866mLnDg6M7S81qrxs6KkO6.jpeg','2024-06-04 07:56:35','2024-06-04 07:56:35',1),(3,'product_images/TkWk80H1UMrJ2Uza7hUFDeQXZooBRgDCvW7CUzOi.jpeg','2024-06-04 08:03:03','2024-06-04 08:03:03',2),(4,'product_images/hDDWDtugbhY8JTIBsuvVj7nuMYWd6chnSQHiByir.jpeg','2024-06-04 08:03:03','2024-06-04 08:03:03',2),(5,'product_images/BkaPG1Hy5UFyU1cwfV29ljKdlQkJhEMIhr9kgB3R.jpeg','2024-06-04 08:08:15','2024-06-04 08:08:15',3),(6,'product_images/VNhRNWlVD9FvXEFyMB2lKABkK6gPDGpafZweLq0h.jpeg','2024-06-04 08:08:15','2024-06-04 08:08:15',3),(7,'product_images/wFFzNTbFWayTU7BD531zdz2X4W1bVI5trX6SOc9k.jpeg','2024-06-04 08:11:18','2024-06-04 08:11:18',4),(8,'product_images/cNDBvf1fmsB3b1kkmYKcGw7WL0CVjOKRjXNbAYPT.jpeg','2024-06-04 08:11:18','2024-06-04 08:11:18',4),(9,'product_images/70nlIXUBwpI1qggrHVEMzL2wCYLzzbsIMCxKkEGF.jpeg','2024-06-04 08:14:39','2024-06-04 08:14:39',5),(10,'product_images/FjJkmADE2pKRF3scTm2THcT2oDm0ejff9jrJ7Rqa.jpeg','2024-06-04 08:14:40','2024-06-04 08:14:40',5),(11,'product_images/b9MXVeT6TOJNkqahq45rNtVw60ZQ52nDTp4AWYAF.jpeg','2024-06-04 08:19:56','2024-06-04 08:19:56',6),(12,'product_images/vQQOMYSWfdOhPAjRruXHfWi9gkJj0CbjWtBEMsyQ.jpeg','2024-06-04 08:19:57','2024-06-04 08:19:57',6),(13,'product_images/fvez6ak2dTwVxrRfpUirtRMQ4kBqJEQMzMwoXf0F.jpeg','2024-06-04 08:23:08','2024-06-04 08:23:08',7),(14,'product_images/B9jltlLwHvmENOGWINDM29m4dSb59qLoFUUniIWI.jpeg','2024-06-04 08:23:09','2024-06-04 08:23:09',7),(15,'product_images/1ttAYGigBbQSeok1gTcOVxZ9aZoDEnhM5FmMOQ5t.jpeg','2024-06-04 08:26:36','2024-06-04 08:26:36',8),(16,'product_images/B55npsQGSxc0u3FkPYK01AwEYa0DSbTzu21XVGr3.jpeg','2024-06-04 08:26:37','2024-06-04 08:26:37',8),(17,'product_images/nK5P6obaEJC6URrBBdZ5nGcGlW1UBQ4RFhg7RNpf.jpeg','2024-06-04 08:41:03','2024-06-04 08:41:03',9),(18,'product_images/p5IGmNO0Xf47J5w7m1ZMQ1O0XaXQNrWQFaTF2RpT.jpeg','2024-06-04 08:41:03','2024-06-04 08:41:03',9);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (32,'2014_10_12_000000_create_users_table',1),(33,'2014_10_12_100000_create_password_resets_table',1),(34,'2024_05_31_134540_create_products_table',1),(35,'2024_05_31_172814_create_categories_table',1),(36,'2024_05_31_175014_add_category_id_to_products_table',1),(37,'2024_06_02_201637_create_images_table',1),(38,'2024_06_02_202104_add_product_id_to_images_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2024-06-04 07:56:30','2024-06-04 07:56:30','Red Lipstick',56.00,'Load your lips with long lasting and impeccable red colour to fulfill your makeup requirements.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',2),(2,'2024-06-04 08:03:01','2024-06-04 08:03:01','Blush Palette',70.00,'Are you a blush and highlighting fanatic? Yeah, us too! We’re excited to show off our new Fanatic Blush and Highlighting collection. 4 unique palettes focused on gorgeous blushes or filled with glowing highlighters. Grab a brush and show those cheeks some love.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',1),(3,'2024-06-04 08:08:13','2024-06-04 08:08:13','Eyeshadow Palette',150.00,'Are you an eyeshadow fanatic? We are! Meet our new Fanatic Eyeshadow collection. 4 unique palettes with 12 richly-pigmented shades in an array of matte and satin finishes. Create a fabulous eye look to inspire beauty. We’re your biggest fan.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',3),(4,'2024-06-04 08:11:16','2024-06-04 08:11:16','Fineline Eyeliner',25.00,'Water-based, Fineline Eyeliner is available in a selection of shades that precisely line the eyes and create the ultimate winged look. With a soft and flexible tip, the highly-pigmented formula glides seamlessly over the skin and follows the curves of the eye with maximum control.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',3),(5,'2024-06-04 08:14:36','2024-06-04 08:14:36','Poreless Foundation',75.00,'Poreless from Maybelline goes beyond skin tone matching to fit the unique texture issues of normal to oily skin for the ultimate natural skin fit. While some foundations can exaggerate pores and oily skin, only Maybelline\'s pore-minimizing foundation contains their genius blurring micro-powders that erase pores and absorb oil for a naturally matte and poreless-looking finish.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',1),(6,'2024-06-04 08:19:53','2024-06-04 08:19:53','Lifter Gloss',45.00,'Drench lips with hydrating shine for a fuller, lifted look. Lip Lifter Lip Gloss\'s formula visibly smooths lip surface and enhances lip contour with high shine. Plus, its XL wand transforms lips in an easy, one swipe application. 90% agree lips feel hydrated. *in a consumer test. Formulated with Hyaluronic Acid. Apply it for a hydrating, glossy shine and fuller look.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',2),(7,'2024-06-04 08:23:06','2024-06-04 08:23:06','Matte Lipstick',67.00,'Load your lips with long lasting and impeccable red colour to fulfill your makeup requirements.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',2),(8,'2024-06-04 08:26:32','2024-06-04 08:26:32','Glow Blush Beauty',58.00,'Are you a blush and highlighting fanatic? Yeah, us too! We’re excited to show off our new Fanatic Blush and Highlighting collection. 4 unique palettes focused on gorgeous blushes or filled with glowing highlighters. Grab a brush and show those cheeks some love.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',1),(9,'2024-06-04 08:41:00','2024-06-04 08:41:00','Poreless Putty Primer',58.00,'This skin perfecting poreless putty primer is infused with Squalane to help grip makeup for all-day wear and help protect skin from moisture loss. The velvety texture glides effortlessly over the skin, smoothing over imperfections while helping minimize the appearance of pores for a poreless effect.','1. Exfoliate your lips.\n2. Line your lips with the CCUK Lip definer, then fill them in.\n3. Blot your lips for an extra-matte finish.\n*Please note that actual colours may vary slightly.','23',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 23:26:15
