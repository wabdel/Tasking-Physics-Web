-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 10.106.79.191    Database: physics_tasking
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `points`
--

DROP TABLE IF EXISTS `points`;
/*!50001 DROP VIEW IF EXISTS `points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `points` AS SELECT 
 1 AS `user_id`,
 1 AS `recent_task_points`,
 1 AS `annual_task_points`,
 1 AS `recent_scheduled_task_points`,
 1 AS `annual_scheduled_task_points`,
 1 AS `recent_plan_points`,
 1 AS `annual_plan_points`,
 1 AS `tasks_total`,
 1 AS `plans_total`,
 1 AS `total`,
 1 AS `is_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `plans_completed`
--

DROP TABLE IF EXISTS `plans_completed`;
/*!50001 DROP VIEW IF EXISTS `plans_completed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `plans_completed` AS SELECT 
 1 AS `plan_id`,
 1 AS `patient_id`,
 1 AS `plan_type_id`,
 1 AS `user_id`,
 1 AS `assignment_date`,
 1 AS `assigned_by_id`,
 1 AS `due_date`,
 1 AS `is_completed`,
 1 AS `completion_date`,
 1 AS `notes`,
 1 AS `is_replan`,
 1 AS `physician_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `annual_plan_points`
--

DROP TABLE IF EXISTS `annual_plan_points`;
/*!50001 DROP VIEW IF EXISTS `annual_plan_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `annual_plan_points` AS SELECT 
 1 AS `user_id`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `recent_scheduled_task_points`
--

DROP TABLE IF EXISTS `recent_scheduled_task_points`;
/*!50001 DROP VIEW IF EXISTS `recent_scheduled_task_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recent_scheduled_task_points` AS SELECT 
 1 AS `user_id`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `task_points`
--

DROP TABLE IF EXISTS `task_points`;
/*!50001 DROP VIEW IF EXISTS `task_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `task_points` AS SELECT 
 1 AS `user_id`,
 1 AS `sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `recent_plan_points`
--

DROP TABLE IF EXISTS `recent_plan_points`;
/*!50001 DROP VIEW IF EXISTS `recent_plan_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recent_plan_points` AS SELECT 
 1 AS `user_id`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `plans_due`
--

DROP TABLE IF EXISTS `plans_due`;
/*!50001 DROP VIEW IF EXISTS `plans_due`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `plans_due` AS SELECT 
 1 AS `plan_id`,
 1 AS `patient_id`,
 1 AS `plan_type_id`,
 1 AS `user_id`,
 1 AS `assignment_date`,
 1 AS `assigned_by_id`,
 1 AS `due_date`,
 1 AS `is_completed`,
 1 AS `completion_date`,
 1 AS `notes`,
 1 AS `is_replan`,
 1 AS `physician_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tasks_completed`
--

DROP TABLE IF EXISTS `tasks_completed`;
/*!50001 DROP VIEW IF EXISTS `tasks_completed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tasks_completed` AS SELECT 
 1 AS `task_id`,
 1 AS `task_type_id`,
 1 AS `user_id`,
 1 AS `completion_date`,
 1 AS `multiplier`,
 1 AS `notes`,
 1 AS `link_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `annual_scheduled_task_points`
--

DROP TABLE IF EXISTS `annual_scheduled_task_points`;
/*!50001 DROP VIEW IF EXISTS `annual_scheduled_task_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `annual_scheduled_task_points` AS SELECT 
 1 AS `user_id`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `completed_assigned_tasks`
--

DROP TABLE IF EXISTS `completed_assigned_tasks`;
/*!50001 DROP VIEW IF EXISTS `completed_assigned_tasks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `completed_assigned_tasks` AS SELECT 
 1 AS `scheduled_task_id`,
 1 AS `task_type_name`,
 1 AS `task_group_id`,
 1 AS `task_group_name`,
 1 AS `machine_name`,
 1 AS `machine_id`,
 1 AS `initials`,
 1 AS `due_date`,
 1 AS `completion_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `annual_task_points`
--

DROP TABLE IF EXISTS `annual_task_points`;
/*!50001 DROP VIEW IF EXISTS `annual_task_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `annual_task_points` AS SELECT 
 1 AS `user_id`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `recent_task_points`
--

DROP TABLE IF EXISTS `recent_task_points`;
/*!50001 DROP VIEW IF EXISTS `recent_task_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recent_task_points` AS SELECT 
 1 AS `user_id`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `plan_points`
--

DROP TABLE IF EXISTS `plan_points`;
/*!50001 DROP VIEW IF EXISTS `plan_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `plan_points` AS SELECT 
 1 AS `user_id`,
 1 AS `sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `points`
--

/*!50001 DROP VIEW IF EXISTS `points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `points` AS select `recent_task_points`.`user_id` AS `user_id`,ifnull(`recent_task_points`.`points`,0) AS `recent_task_points`,ifnull(`annual_task_points`.`points`,0) AS `annual_task_points`,ifnull(`recent_scheduled_task_points`.`points`,0) AS `recent_scheduled_task_points`,ifnull(`annual_scheduled_task_points`.`points`,0) AS `annual_scheduled_task_points`,ifnull(`recent_plan_points`.`points`,0) AS `recent_plan_points`,ifnull(`annual_plan_points`.`points`,0) AS `annual_plan_points`,((0.9 * (ifnull(`recent_task_points`.`points`,0) + ifnull(`recent_scheduled_task_points`.`points`,0))) + (0.1 * (ifnull(`annual_task_points`.`points`,0) + ifnull(`annual_scheduled_task_points`.`points`,0)))) AS `tasks_total`,((0.9 * ifnull(`recent_plan_points`.`points`,0)) + (0.1 * ifnull(`annual_plan_points`.`points`,0))) AS `plans_total`,((0.9 * ((ifnull(`recent_task_points`.`points`,0) + ifnull(`recent_plan_points`.`points`,0)) + ifnull(`recent_scheduled_task_points`.`points`,0))) + (0.1 * ((ifnull(`annual_task_points`.`points`,0) + ifnull(`annual_plan_points`.`points`,0)) + ifnull(`annual_scheduled_task_points`.`points`,0)))) AS `total`,`users`.`is_active` AS `is_active` from ((((((`recent_task_points` join `annual_task_points` on((`recent_task_points`.`user_id` = `annual_task_points`.`user_id`))) join `recent_scheduled_task_points` on((`recent_task_points`.`user_id` = `recent_scheduled_task_points`.`user_id`))) join `annual_scheduled_task_points` on((`recent_task_points`.`user_id` = `annual_scheduled_task_points`.`user_id`))) join `recent_plan_points` on((`recent_task_points`.`user_id` = `recent_plan_points`.`user_id`))) join `annual_plan_points` on((`recent_task_points`.`user_id` = `annual_plan_points`.`user_id`))) join `users` on((`recent_task_points`.`user_id` = `users`.`user_id`))) order by ((0.9 * ((ifnull(`recent_task_points`.`points`,0) + ifnull(`recent_plan_points`.`points`,0)) + ifnull(`recent_scheduled_task_points`.`points`,0))) + (0.1 * ((ifnull(`annual_task_points`.`points`,0) + ifnull(`annual_plan_points`.`points`,0)) + ifnull(`annual_scheduled_task_points`.`points`,0)))) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `plans_completed`
--

/*!50001 DROP VIEW IF EXISTS `plans_completed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `plans_completed` AS select `plans`.`plan_id` AS `plan_id`,`plans`.`patient_id` AS `patient_id`,`plans`.`plan_type_id` AS `plan_type_id`,`plans`.`user_id` AS `user_id`,`plans`.`assignment_date` AS `assignment_date`,`plans`.`assigned_by_id` AS `assigned_by_id`,`plans`.`due_date` AS `due_date`,`plans`.`is_completed` AS `is_completed`,`plans`.`completion_date` AS `completion_date`,`plans`.`notes` AS `notes`,`plans`.`is_replan` AS `is_replan`,`plans`.`physician_id` AS `physician_id` from `plans` where ((`plans`.`completion_date` is not null) and (`plans`.`completion_date` >= (curdate() - interval 14 day))) order by `plans`.`completion_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `annual_plan_points`
--

/*!50001 DROP VIEW IF EXISTS `annual_plan_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `annual_plan_points` AS select `users`.`user_id` AS `user_id`,(select sum((case when (`plan_types`.`name` like '%Brachytherapy%') then `plan_types`.`weight` when (((5 * ((to_days(cast(`plans`.`due_date` as date)) - to_days(cast(`plans`.`assignment_date` as date))) DIV 7)) + substr('0123334401222334011122340001123400012344001234440',(((7 * weekday(cast(`plans`.`assignment_date` as date))) + weekday(cast(`plans`.`due_date` as date))) + 1),1)) = 0) then (`plan_types`.`weight` * 2) when (((5 * ((to_days(cast(`plans`.`due_date` as date)) - to_days(cast(`plans`.`assignment_date` as date))) DIV 7)) + substr('0123334401222334011122340001123400012344001234440',(((7 * weekday(cast(`plans`.`assignment_date` as date))) + weekday(cast(`plans`.`due_date` as date))) + 1),1)) = 1) then (`plan_types`.`weight` * 1.5) when (((5 * ((to_days(cast(`plans`.`due_date` as date)) - to_days(cast(`plans`.`assignment_date` as date))) DIV 7)) + substr('0123334401222334011122340001123400012344001234440',(((7 * weekday(cast(`plans`.`assignment_date` as date))) + weekday(cast(`plans`.`due_date` as date))) + 1),1)) = 2) then (`plan_types`.`weight` * 1.25) else `plan_types`.`weight` end)) from (`plans` join `plan_types` on((`plans`.`plan_type_id` = `plan_types`.`plan_type_id`))) where ((`plans`.`user_id` = `users`.`user_id`) and ((to_days(curdate()) - to_days(cast(`plans`.`assignment_date` as date))) <= 365) and ((to_days(curdate()) - to_days(cast(`plans`.`assignment_date` as date))) >= 0))) AS `points` from `users` where ((`users`.`is_retired` = false) and (`users`.`category_id` in (2,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recent_scheduled_task_points`
--

/*!50001 DROP VIEW IF EXISTS `recent_scheduled_task_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recent_scheduled_task_points` AS select `users`.`user_id` AS `user_id`,(select sum(((case when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 0) then (`task_types`.`weight` * 0.75) when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 7) then `task_types`.`weight` when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 14) then (`task_types`.`weight` * 1.25) when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 21) then (`task_types`.`weight` * 1.5) else (`task_types`.`weight` * 2) end) * `scheduled_tasks`.`multiplier`)) from (`scheduled_tasks` join `task_types` on((`scheduled_tasks`.`task_type_id` = `task_types`.`task_type_id`))) where ((`scheduled_tasks`.`user_id` = `users`.`user_id`) and (`scheduled_tasks`.`is_completed` = true) and ((to_days(curdate()) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) <= 30) and ((to_days(curdate()) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) >= 0))) AS `points` from `users` where ((`users`.`is_retired` = false) and (`users`.`category_id` in (2,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `task_points`
--

/*!50001 DROP VIEW IF EXISTS `task_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `task_points` AS select `tasks`.`user_id` AS `user_id`,sum(((`task_types`.`weight` * `tasks`.`multiplier`) * exp(((-(ln(2)) * (to_days(curdate()) - to_days(`tasks`.`completion_date`))) / 14)))) AS `sum` from (`tasks` join `task_types` on((`tasks`.`task_type_id` = `task_types`.`task_type_id`))) group by `tasks`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recent_plan_points`
--

/*!50001 DROP VIEW IF EXISTS `recent_plan_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recent_plan_points` AS select `users`.`user_id` AS `user_id`,(select sum((if((((5 * ((to_days(curdate()) - to_days(cast(`plans`.`due_date` as date))) DIV 7)) + substr('0123334401222334011122340001123400012344001234440',(((7 * weekday(cast(`plans`.`due_date` as date))) + weekday(curdate())) + 1),1)) > 0),exp(((-(ln(2)) * (to_days(curdate()) - to_days(cast(`plans`.`due_date` as date)))) / 14)),1) * (case when (`plan_types`.`name` like '%Brachytherapy%') then `plan_types`.`weight` when (((5 * ((to_days(cast(`plans`.`due_date` as date)) - to_days(cast(`plans`.`assignment_date` as date))) DIV 7)) + substr('0123334401222334011122340001123400012344001234440',(((7 * weekday(cast(`plans`.`assignment_date` as date))) + weekday(cast(`plans`.`due_date` as date))) + 1),1)) = 0) then (`plan_types`.`weight` * 2) when (((5 * ((to_days(cast(`plans`.`due_date` as date)) - to_days(cast(`plans`.`assignment_date` as date))) DIV 7)) + substr('0123334401222334011122340001123400012344001234440',(((7 * weekday(cast(`plans`.`assignment_date` as date))) + weekday(cast(`plans`.`due_date` as date))) + 1),1)) = 1) then (`plan_types`.`weight` * 1.5) when (((5 * ((to_days(cast(`plans`.`due_date` as date)) - to_days(cast(`plans`.`assignment_date` as date))) DIV 7)) + substr('0123334401222334011122340001123400012344001234440',(((7 * weekday(cast(`plans`.`assignment_date` as date))) + weekday(cast(`plans`.`due_date` as date))) + 1),1)) = 2) then (`plan_types`.`weight` * 1.25) else `plan_types`.`weight` end))) from (`plans` join `plan_types` on((`plans`.`plan_type_id` = `plan_types`.`plan_type_id`))) where ((`plans`.`user_id` = `users`.`user_id`) and ((to_days(curdate()) - to_days(cast(`plans`.`assignment_date` as date))) <= 30) and ((to_days(curdate()) - to_days(cast(`plans`.`assignment_date` as date))) >= 0))) AS `points` from `users` where ((`users`.`is_retired` = false) and (`users`.`category_id` in (2,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `plans_due`
--

/*!50001 DROP VIEW IF EXISTS `plans_due`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `plans_due` AS select `plans`.`plan_id` AS `plan_id`,`plans`.`patient_id` AS `patient_id`,`plans`.`plan_type_id` AS `plan_type_id`,`plans`.`user_id` AS `user_id`,`plans`.`assignment_date` AS `assignment_date`,`plans`.`assigned_by_id` AS `assigned_by_id`,`plans`.`due_date` AS `due_date`,`plans`.`is_completed` AS `is_completed`,`plans`.`completion_date` AS `completion_date`,`plans`.`notes` AS `notes`,`plans`.`is_replan` AS `is_replan`,`plans`.`physician_id` AS `physician_id` from `plans` where (`plans`.`completion_date` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tasks_completed`
--

/*!50001 DROP VIEW IF EXISTS `tasks_completed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tasks_completed` AS select `tasks`.`task_id` AS `task_id`,`tasks`.`task_type_id` AS `task_type_id`,`tasks`.`user_id` AS `user_id`,`tasks`.`completion_date` AS `completion_date`,`tasks`.`multiplier` AS `multiplier`,`tasks`.`notes` AS `notes`,`tasks`.`link_id` AS `link_id` from `tasks` where ((`tasks`.`completion_date` is not null) and (`tasks`.`completion_date` >= (curdate() - interval 14 day))) order by `tasks`.`completion_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `annual_scheduled_task_points`
--

/*!50001 DROP VIEW IF EXISTS `annual_scheduled_task_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `annual_scheduled_task_points` AS select `users`.`user_id` AS `user_id`,(select sum(((case when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 0) then (`task_types`.`weight` * 0.75) when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 7) then `task_types`.`weight` when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 14) then (`task_types`.`weight` * 1.25) when ((to_days(cast(`scheduled_tasks`.`due_date` as date)) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) < 21) then (`task_types`.`weight` * 1.5) else (`task_types`.`weight` * 2) end) * `scheduled_tasks`.`multiplier`)) from (`scheduled_tasks` join `task_types` on((`scheduled_tasks`.`task_type_id` = `task_types`.`task_type_id`))) where ((`scheduled_tasks`.`user_id` = `users`.`user_id`) and (`scheduled_tasks`.`is_completed` = true) and ((to_days(curdate()) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) <= 365) and ((to_days(curdate()) - to_days(cast(`scheduled_tasks`.`completion_date` as date))) >= 0))) AS `points` from `users` where ((`users`.`is_retired` = false) and (`users`.`category_id` in (2,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `completed_assigned_tasks`
--

/*!50001 DROP VIEW IF EXISTS `completed_assigned_tasks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `completed_assigned_tasks` AS select `scheduled_tasks`.`scheduled_task_id` AS `scheduled_task_id`,`task_types`.`name` AS `task_type_name`,`task_groups`.`task_group_id` AS `task_group_id`,`task_groups`.`name` AS `task_group_name`,`machines`.`name` AS `machine_name`,`machines`.`machine_id` AS `machine_id`,`users`.`initials` AS `initials`,cast(`scheduled_tasks`.`due_date` as date) AS `due_date`,cast(`scheduled_tasks`.`completion_date` as date) AS `completion_date` from ((((`scheduled_tasks` join `task_types` on((`scheduled_tasks`.`task_type_id` = `task_types`.`task_type_id`))) join `machines` on((`scheduled_tasks`.`machine_id` = `machines`.`machine_id`))) join `task_groups` on((`task_types`.`task_group_id` = `task_groups`.`task_group_id`))) join `users` on((`scheduled_tasks`.`user_id` = `users`.`user_id`))) where (`scheduled_tasks`.`is_completed` = true) order by cast(`scheduled_tasks`.`due_date` as date) desc,`scheduled_tasks`.`scheduled_task_id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `annual_task_points`
--

/*!50001 DROP VIEW IF EXISTS `annual_task_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `annual_task_points` AS select `users`.`user_id` AS `user_id`,(select sum((`task_types`.`weight` * `tasks`.`multiplier`)) AS `points` from (`tasks` join `task_types` on((`tasks`.`task_type_id` = `task_types`.`task_type_id`))) where ((`tasks`.`user_id` = `users`.`user_id`) and ((to_days(curdate()) - to_days(cast(`tasks`.`completion_date` as date))) <= 365) and ((to_days(curdate()) - to_days(cast(`tasks`.`completion_date` as date))) >= 0))) AS `points` from `users` where ((`users`.`is_retired` = false) and (`users`.`category_id` in (2,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recent_task_points`
--

/*!50001 DROP VIEW IF EXISTS `recent_task_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recent_task_points` AS select `users`.`user_id` AS `user_id`,(select sum(((`task_types`.`weight` * `tasks`.`multiplier`) * exp(((-(ln(2)) * (to_days(curdate()) - to_days(cast(`tasks`.`completion_date` as date)))) / 14)))) AS `points` from (`tasks` join `task_types` on((`tasks`.`task_type_id` = `task_types`.`task_type_id`))) where ((`tasks`.`user_id` = `users`.`user_id`) and ((to_days(curdate()) - to_days(cast(`tasks`.`completion_date` as date))) <= 30) and ((to_days(curdate()) - to_days(cast(`tasks`.`completion_date` as date))) >= 0))) AS `points` from `users` where ((`users`.`is_retired` = false) and (`users`.`category_id` in (2,3))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `plan_points`
--

/*!50001 DROP VIEW IF EXISTS `plan_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`physics_tasking_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `plan_points` AS select `plans`.`user_id` AS `user_id`,sum((`plan_types`.`weight` * exp(((-(ln(2)) * (to_days(curdate()) - to_days(`plans`.`assignment_date`))) / 14)))) AS `sum` from (`plans` join `plan_types` on((`plans`.`plan_type_id` = `plan_types`.`plan_type_id`))) group by `plans`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 16:13:12
