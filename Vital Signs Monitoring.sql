
/*
Created: 11/16/2015
Modified: 12/8/2015
Project: Health Monitoring System
Model: MySQL 5.6
Company: Northeastern University
Author: Data Revolvers
Version: 1.1
Database: MySQL 5.6
*/


-- Create tables section -------------------------------------------------

-- Table AllDevices_Table

CREATE TABLE `AllDevices_Table`
(
  `DeviceID` Smallint NOT NULL AUTO_INCREMENT,
  `DeviceName` Char(20),
  `DeviceDescription` Varchar(200),
  `DevicePrice` Double,
  `DeviceRechargeCycles` Int,
  `DeviceChargeTime` Int,
  `DeviceRadioConn` Char(20),
  `DeviceOpTempLow` Float,
  `DeviceOpTempHigh` Float,
  `DeviceAltitudeMax` Int,
  `UserID` Int NOT NULL,
  PRIMARY KEY (`DeviceID`,`UserID`)
)
;

-- Table User_Table

CREATE TABLE `User_Table`
(
  `UserID` Int NOT NULL AUTO_INCREMENT,
  `UserName` Char(30) NOT NULL,
  `UserAddress` Varchar(80),
  `UserCity` Char(20),
  `UserZipCode` Char(20),
  `UserPhoneNumber` Char(15) NOT NULL,
  `UserDOB` Date NOT NULL,
  `UserAge` Smallint,
  `UserGender` Char(6),
  PRIMARY KEY (`UserID`)
)
;

-- Table UserHistory_Table

CREATE TABLE `UserHistory_Table`
(
  `UserHistoryID` Int NOT NULL AUTO_INCREMENT,
  `UserName` Char(30) NOT NULL,
  `UserAddress` Varchar(80),
  `UserCity` Char(20),
  `UserZipCode` Char(20),
  `UserPhoneNumber` Char(15) NOT NULL,
  `UserDOB` Date NOT NULL,
  `UserAge` Smallint,
  `UserGender` Char(6),
  `UserUpdatedBy` Char(20),
  `UserUpdateDate` Date,
  `UserID` Int NOT NULL,
  PRIMARY KEY (`UserHistoryID`,`UserID`)
)
;

-- Table Athlete_Table

CREATE TABLE `Athlete_Table`
(
  `AthleteID` Int NOT NULL AUTO_INCREMENT,
  `AthleteHeight` Smallint NOT NULL
 COMMENT 'In centimeters',
  `AthleteWeight` Double(3,2) NOT NULL
 COMMENT 'InPounds',
  `AthleteBMI` Double(3,2),
  `AthleteSignCaptureDate` Date NOT NULL,
  `UserID` Int NOT NULL,
  PRIMARY KEY (`AthleteID`,`UserID`)
)
;

-- Table SafeHeartRate_Table

CREATE TABLE `SafeHeartRate_Table`
(
  `ShrAgeMin` Smallint,
  `ShrAgeMax` Smallint,
  `ShrMinHR` Smallint,
  `ShrMaxHR` Smallint
)
;

-- Table Activity_Table

CREATE TABLE `Activity_Table`
(
  `ActivityDistance` Double
 COMMENT 'Distance in miles',
  `ActivityTimeInterval` Smallint,
  `ActivityCaloriesBurnt` Int,
  `ActivityDate` Date,
  `ActivityMaxHeartRate` Smallint,
  `AthleteID` Int NOT NULL,
  `UserID` Int NOT NULL,
  `ActivityID` Smallint NOT NULL
)
;

ALTER TABLE `Activity_Table` ADD  PRIMARY KEY (`AthleteID`,`UserID`,`ActivityID`)
;

-- Table Remedy_Table

CREATE TABLE `Remedy_Table`
(
  `AthleteID` Int NOT NULL,
  `UserID` Int NOT NULL,
  `ActivityID` Smallint NOT NULL,
  `RemedyID` Smallint NOT NULL
)
;

ALTER TABLE `Remedy_Table` ADD  PRIMARY KEY (`AthleteID`,`UserID`,`ActivityID`,`RemedyID`)
;

-- Table Patient_Table

CREATE TABLE `Patient_Table`
(
  `PatientID` Int NOT NULL AUTO_INCREMENT,
  `PatientIsDiabetic` Bool NOT NULL,
  `PatientSystemSuggestion` Varchar(100),
  `UserID` Int NOT NULL,
  `DoctorID` Int NOT NULL,
  PRIMARY KEY (`PatientID`,`UserID`,`DoctorID`)
)
;

-- Table PatientHistory_Table

CREATE TABLE `PatientHistory_Table`
(
  `PatientHistoryID` Int NOT NULL AUTO_INCREMENT,
  `PatientDoctorName` Char(20),
  `PatientIsDiabetic` Bool,
  `PatientUpdatedBy` Char(20),
  `PatientUpdateDate` Date,
  `UserID` Int NOT NULL,
  `PatientID` Int NOT NULL,
  `DoctorID` Int NOT NULL,
  PRIMARY KEY (`PatientHistoryID`,`PatientID`,`UserID`,`DoctorID`)
)
;


-- Table DiabeticMeasure_Table

CREATE TABLE `DiabeticMeasure_Table`
(
  `DiabeticMeasureFSGLevel` Double,
  `DiabeticMeasureFPGLevel` Double,
  `DiabeticMeasuresDate` Date,
  `PatientID` Int NOT NULL,
  `UserID` Int NOT NULL,
  `DoctorID` Int NOT NULL
)
;

ALTER TABLE `DiabeticMeasure_Table` ADD  PRIMARY KEY (`PatientID`,`UserID`,`DoctorID`)
;

-- Table DiabeticReferenceMeasures_Table

CREATE TABLE `DiabeticReferenceMeasures_Table`
(
  `DiabeticRefAgeMin` Smallint,
  `DiabeticRefGender` Char(10),
  `DiabeticRefFSGHigh` Double,
  `DiabeticRefFPGHigh` Double,
  `DiabeticRefFSGLow` Double,
  `DiabeticRefFPGLow` Double,
  `DiabeticRefAgeMax` Smallint
)
;

-- Table NonDiabeticReferenceMeasures_Table

CREATE TABLE `NonDiabeticReferenceMeasures_Table`
(
  `NonDiabeticRefFSGHigh` Double,
  `NonDiabeticRefFPGHigh` Double,
  `NonDiabeticRefAgeMin` Smallint,
  `NonDiabeticRefGender` Char(10),
  `NonDiabeticRefFPGLow` Double,
  `NonDiabeticRefFSGLow` Double,
  `NonDiabeticRefAgeMax` Smallint
)
;

-- Table Doctor_Table

CREATE TABLE `Doctor_Table`
(
  `DoctorID` Int NOT NULL AUTO_INCREMENT,
  `DoctorName` Char(20),
  `DoctorPhoneNumber` Char(20),
  PRIMARY KEY (`DoctorID`)
)
;

-- Table Clinic_Table

CREATE TABLE `Clinic_Table`
(
  `ClinicID` Int NOT NULL AUTO_INCREMENT,
  `ClinicName` Char(30),
  `ClinicAddress` Varchar(50),
  `ClinicCity` Char(20),
  `ClinicZipCode` Char(20),
  `DoctorID` Int NOT NULL,
  PRIMARY KEY (`ClinicID`,`DoctorID`)
)
;

-- Table Treatment_Table

CREATE TABLE `Treatment_Table`
(
  `TreatmentID` Int NOT NULL AUTO_INCREMENT,
  `TreatmentDuration` Int,
  `TreatmentDescription` Varchar(200),
  `DoctorID` Int NOT NULL,
  PRIMARY KEY (`TreatmentID`,`DoctorID`)
)
;

-- Table AllActivity_Table

CREATE TABLE `AllActivity_Table`
(
  `ActivityID` Smallint NOT NULL AUTO_INCREMENT,
  `ActivityName` Char(20) NOT NULL,
  PRIMARY KEY (`ActivityID`)
)
;

-- Table AllRemedy_Table

CREATE TABLE `AllRemedy_Table`
(
  `RemedyID` Smallint NOT NULL AUTO_INCREMENT,
  `RemedyDescription` Varchar(200),
  PRIMARY KEY (`RemedyID`)
)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `Athlete_Table` ADD CONSTRAINT `IsA` FOREIGN KEY (`UserID`) REFERENCES `User_Table` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Activity_Table` ADD CONSTRAINT `Performs` FOREIGN KEY (`AthleteID`, `UserID`) REFERENCES `Athlete_Table` (`AthleteID`, `UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DiabeticMeasure_Table` ADD CONSTRAINT `SampleMeasures` FOREIGN KEY (`PatientID`, `UserID`, `DoctorID`) REFERENCES `Patient_Table` (`PatientID`, `UserID`, `DoctorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Treatment_Table` ADD CONSTRAINT `Suggests` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor_Table` (`DoctorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Patient_Table` ADD CONSTRAINT `CanBeA` FOREIGN KEY (`UserID`) REFERENCES `User_Table` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `UserHistory_Table` ADD CONSTRAINT `UserHistoryMaintained` FOREIGN KEY (`UserID`) REFERENCES `User_Table` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `PatientHistory_Table` ADD CONSTRAINT `ArchievedIn` FOREIGN KEY (`PatientID`, `UserID`, `DoctorID`) REFERENCES `Patient_Table` (`PatientID`, `UserID`, `DoctorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Activity_Table` ADD CONSTRAINT `ConsistsOf` FOREIGN KEY (`ActivityID`) REFERENCES `AllActivity_Table` (`ActivityID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Remedy_Table` ADD CONSTRAINT `Recommends` FOREIGN KEY (`AthleteID`, `UserID`, `ActivityID`) REFERENCES `Activity_Table` (`AthleteID`, `UserID`, `ActivityID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Remedy_Table` ADD CONSTRAINT `ComprisesOf` FOREIGN KEY (`RemedyID`) REFERENCES `AllRemedy_Table` (`RemedyID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Patient_Table` ADD CONSTRAINT `Treats` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor_Table` (`DoctorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `AllDevices_Table` ADD CONSTRAINT `uses` FOREIGN KEY (`UserID`) REFERENCES `User_Table` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Clinic_Table` ADD CONSTRAINT `belongsTo` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor_Table` (`DoctorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;



-- Functions section -------------------------------------------------
DELIMITER $$
CREATE FUNCTION `CalculateSquare`(num double) RETURNS double
BEGIN
Declare  result double;
SET result = num * num;
RETURN result;
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION `CalculateCube`(num double) RETURNS double
BEGIN
Declare  result double;
SET result = num * num * num;
RETURN result;
END$$
DELIMITER ;


-- Procedures section -------------------------------------------------


---------------------------- Procedure 1 -------------------------

DELIMITER $$
CREATE  PROCEDURE `CalculateAge`(in ID int)
BEGIN
Declare age int;
SET age = (SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),(select UserDOB from user_table where UserID = ID))), '%Y'));
update user_table set UserAge = age where UserID = ID;
END$$
DELIMITER ;

---------------------------- Procedure 2 -------------------------

DELIMITER $$
CREATE PROCEDURE `CalculateBMI`(in ID int)
Begin
declare BMI double;
declare height int;
declare weight double;
select AthleteHeight, AthleteWeight from athlete_table where AthleteID = ID into height,weight;
set BMI = (weight * 4500)/(height * height);
select BMI;
update athlete_table set AthleteBMI = BMI where AthleteID = ID;
END$$
DELIMITER ;

---------------------------- Procedure 3 -------------------------

DELIMITER $$
CREATE PROCEDURE `CalculateCaloriesBurnt`(in athID int, in useID int, in activID int)
Begin
declare calories int;
declare speed float;
declare km float;
declare weight double;
declare minutes double;


SELECT activity_table.ActivityTimeInterval, activity_table.ActivityDistance
FROM activity_table 
WHERE activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID into minutes, km;

select athlete_table.athleteweight 
from athlete_table
where athlete_table.AthleteID = athID into weight;

SET speed =  60 * (km/minutes);

IF activID = 5 THEN 												-- Activity Walking
SET calories = (weight * 0.45) * (minutes / 60) * ((0.0215 * CalculateCube(speed))
 + (0.01765 * CalculateSquare(speed)) + (0.8710 * speed) + 1.4577);
 
ELSEIF activID = 2 THEN 											-- Activity Cycling
SET calories = ((3.509* speed) + 0.2581 * CalculateCube(speed)) * minutes/69.78;

-- Running (9-minute mile) calories burned per pound per minute constant: 0.087

ELSEIF activID = 3 THEN 											-- Activity running
SET calories = 0.087 * minutes * weight;

-- Weight training, circuit training calories burned per pound per minute constant: 0.042 //

ELSEIF activID = 4 THEN 											-- Heavy Lifting
SET calories = 0.042 * weight * minutes;

-- Swimming, crawl, fast calories burned per pound per minute constant: 0.071 //

ELSEIF activID = 1 THEN 											-- Activity Swimming
SET calories = 0.071 * weight * minutes;
END IF;

update activity_table 
set activity_table.ActivityCaloriesBurnt = calories 
where activity_table.AthleteID = athID AND activity_table.UserID = useID
AND activity_table.ActivityID = activID;

END$$
DELIMITER ;


---------------------------- Procedure 4 -------------------------


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxHR`(in age int, out returnMaxHR int)
BEGIN
DECLARE done INT DEFAULT FALSE;
Declare MaxHR int;
Declare MinAge int;
Declare MaxAge int;

Declare  c_iterator CURSOR for
      SELECT ShrMaxHR, ShrAgeMin, ShrAgeMax from safeheartrate_table;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN c_iterator;

read_loop: LOOP
 FETCH c_iterator INTO MaxHR, MinAge, MaxAge;
	
 IF done THEN
      LEAVE read_loop;
 END IF;
 
 IF age >= MinAge AND age <= MaxAge THEN
	SET returnMaxHR = MaxHR;      
  END IF;
END LOOP;
CLOSE c_iterator;
END$$
DELIMITER ;


---------------------------- Procedure 5 -------------------------

DELIMITER $$
CREATE PROCEDURE `GetDiabeticRange`(in age int, out MaxFSG double, out MinFSG double, out MaxFPG double, out MinFPG double)
BEGIN
DECLARE done INT DEFAULT FALSE;

Declare HighAge int;
Declare LowAge int;
Declare HighFPG double;
Declare HighFSG double;
Declare LowFPG double;
Declare LowFSG double;

Declare  c_iterator CURSOR for
      SELECT DiabeticRefFSGHigh, DiabeticRefFPGHigh, DiabeticRefFSGLow, DiabeticRefFPGLow, DiabeticRefAgeMax, DiabeticRefAgeMin 
      FROM diabeticreferencemeasures_table;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN c_iterator;

read_loop: LOOP
 FETCH c_iterator INTO HighFSG, HighFPG, LowFSG, LowFPG, HighAge, LowAge;
	
 IF done THEN
      LEAVE read_loop;
 END IF;
 
 IF age >= LowAge AND age <= HighAge THEN
	SET MaxFPG = HighFPG; 
    SET MaxFSG = HighFSG;
    SET MinFPG = LowFPG;
    SET MinFSG = LowFSG;
  END IF;
END LOOP;
CLOSE c_iterator;
END$$
DELIMITER ;

---------------------------- Procedure 6 -------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNonDiabeticRange`(in age int, out MaxFSG double, out MinFSG double, out MaxFPG double, out MinFPG double)
BEGIN
DECLARE done INT DEFAULT FALSE;

Declare HighAge int;
Declare LowAge int;
Declare HighFPG double;
Declare HighFSG double;
Declare LowFPG double;
Declare LowFSG double;

Declare  c_iterator CURSOR for
      SELECT nonDiabeticRefFSGHigh, nonDiabeticRefFPGHigh, nonDiabeticRefFSGLow, nonDiabeticRefFPGLow, nonDiabeticRefAgeMax, nonDiabeticRefAgeMin 
      FROM nondiabeticreferencemeasures_table;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN c_iterator;

read_loop: LOOP
 FETCH c_iterator INTO HighFSG, HighFPG, LowFSG, LowFPG, HighAge, LowAge;
	
 IF done THEN
      LEAVE read_loop;
 END IF;
 
 IF age >= LowAge AND age <= HighAge THEN
	SET MaxFPG = HighFPG; 
    SET MaxFSG = HighFSG;
    SET MinFPG = LowFPG;
    SET MinFSG = LowFSG;
  END IF;
END LOOP;
CLOSE c_iterator;
END$$
DELIMITER ;

-- Create Views Section -------------------------------------------------

---------------------------- View 1 -------------------------

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW
 `showcaloriesburned` 
 AS SELECT `user_table`.`UserID` 
 AS `userID`,`user_table`.`UserName` 
 AS `UserName`,`athlete_table`.`AthleteID` 
 AS `AthleteID`,`activity_table`.`ActivityID` 
 AS `ActivityID`,`allactivity_table`.`ActivityName` 
 AS `ActivityName`,`activity_table`.`ActivityCaloriesBurnt` 
 AS `ActivityCaloriesBurnt` FROM 
 (((`user_table` JOIN `athlete_table` ON
 ((`user_table`.`UserID` = `athlete_table`.`UserID`))) 
 JOIN `activity_table` ON
 ((`athlete_table`.`AthleteID` = `activity_table`.`AthleteID`))) JOIN 
 `allactivity_table` ON((`activity_table`.`ActivityID` = `allactivity_table`.`ActivityID`)));

---------------------------- View 2 -------------------------

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW
 `systemdiabeticsuggestions` 
 AS SELECT `user_table`.`UserID` 
 AS `userID`,`user_table`.`UserName` 
 AS `UserName`,`patient_table`.`PatientID` 
 AS `patientID`,`patient_table`.`PatientIsDiabetic` 
 AS `patientisdiabetic`,`patient_table`.`PatientSystemSuggestion` 
 AS `patientSystemSuggestion`,`diabeticmeasure_table`.`DiabeticMeasureFSGLevel` 
 AS `DiabeticmeasureFSGLevel`,`diabeticmeasure_table`.`DiabeticMeasureFPGLevel` 
 AS `DiabeticmeasureFPGLevel` FROM 
 ((`user_table` JOIN `patient_table` ON
 ((`user_table`.`UserID` = `patient_table`.`UserID`))) 
 JOIN `diabeticmeasure_table` ON
 ((`diabeticmeasure_table`.`PatientID` = `patient_table`.`PatientID`))) WHERE
 (`patient_table`.`PatientIsDiabetic` = '1');


-- Create Triggers Section -------------------------------------------------


---------------------------- Trigger 1 -------------------------
DELIMITER $$
CREATE TRIGGER  Alert_After_HeartRate_Insert AFTER INSERT ON activity_table

FOR EACH ROW
BEGIN		
    Declare age int;      
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    call GetMaxHR(age, @MaxHR);
    
    
	IF NEW.ActivityMaxHeartRate > @MaxHR THEN
        
		Insert into remedy_table (remedy_table.AthleteID, 
									remedy_table.UserID, 
									remedy_table.ActivityID, 
									remedy_table.RemedyID) 
								values (NEW.AthleteID, 
										NEW.UserID , 
										NEW.ActivityID, 2);
            
	ELSE
			Insert into remedy_table (remedy_table.AthleteID, 
									remedy_table.UserID, 
									remedy_table.ActivityID, 
									remedy_table.RemedyID) 
							values (NEW.AthleteID, 
									NEW.UserID , 
									NEW.ActivityID, 1);
            
		END IF;		
    END$$

DELIMITER ;

---------------------------- Trigger 2 -------------------------
DELIMITER $$
CREATE TRIGGER  Alert_After_HeartRate_Update AFTER UPDATE ON activity_table

FOR EACH ROW
BEGIN		
    Declare age int;
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    call GetMaxHR(age, @MaxHR);
    
    
		IF NEW.ActivityMaxHeartRate > @MaxHR THEN
            update remedy_table SET remedy_table.RemedyID = 2 where remedy_table.AthleteID = NEW.AthleteID AND
																	remedy_table.UserID = NEW.UserID AND
                                                                    remedy_table.ActivityID = NEW.ActivityID;
		ELSE
			update remedy_table SET remedy_table.RemedyID = 1 where remedy_table.AthleteID = NEW.AthleteID AND
																	remedy_table.UserID = NEW.UserID AND
                                                                    remedy_table.ActivityID = NEW.ActivityID;
		END IF;		
    END$$

DELIMITER ;


---------------------------- Trigger 3 -------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER  Alert_After_HeartRate_Delete AFTER DELETE ON activity_table

FOR EACH ROW
BEGIN	

	Delete FROM remedy_table where remedy_table.AthleteID = OLD.AthleteID AND
									remedy_table.UserID = OLD.UserID AND
									remedy_table.ActivityID = OLD.ActivityID;
                                    
    END$$
DELIMITER ; 

---------------------------- Trigger 4 -------------------------   
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER  Add_AGE_After_AthleteTable_Insert AFTER INSERT ON athlete_table

FOR EACH ROW
BEGIN
	call CalculateAge(New.UserID);
END$$
DELIMITER ;


---------------------------- Trigger 5 -------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER  Add_AGE_After_PatientTable_Insert AFTER INSERT ON patient_table

FOR EACH ROW
BEGIN
	call CalculateAge(New.UserID);
END$$
DELIMITER ;

---------------------------- Trigger 6 -------------------------

DELIMITER $$
CREATE TRIGGER  Check_Diabetic_Value_Insert AFTER INSERT ON diabeticmeasure_table

FOR EACH ROW
BEGIN	
	Declare age int;
	Declare FSG double;
    Declare FPG double;
    Declare isDiabetic boolean;
    Declare adviceFSG varchar(100);
    Declare adviceFPG varchar(100);
    Declare SingleStr varchar(200);
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    Select PatientIsDiabetic from patient_table 
    where patient_table.UserID = NEW.UserID AND 
    patient_table.PatientID = NEW.PatientID AND
    patient_table.DoctorID = NEW.DoctorID
    into isDiabetic;
    
           
		IF isDiabetic THEN
			call GetDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);	
			
		ELSE
			call GetNonDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);
			
		END IF;
		
		IF NEW.DiabeticMeasureFSGLevel > @MinFSG AND NEW.DiabeticMeasureFSGLevel < @MaxFSG THEN
				SET adviceFSG = 'FSG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel <= @MinFSG THEN
				SET adviceFSG = 'FSG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel >= @MaxFSG THEN
				SET adviceFSG = 'FSG is overshooting or closer to Higher limits.' ;
			END IF;
			
		IF NEW.DiabeticMeasureFPGLevel > @MinFPG AND NEW.DiabeticMeasureFPGLevel < @MaxFPG THEN
				SET adviceFPG = 'FPG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel <= @MinFPG THEN
				SET adviceFPG = 'FPG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel >= @MaxFPG THEN
				SET adviceFPG = 'FPG is overshooting or closer to Higher limits.' ;
		END IF;
		
		IF isDiabetic THEN
			SET SingleStr = concat_ws(' ','Diabetic:', adviceFSG, adviceFPG);    
		ELSE
			SET SingleStr = concat_ws(' ','Non-Diabetic:', adviceFSG, adviceFPG);
			
		END IF;
		
		update patient_table Set PatientSystemSuggestion = SingleStr
				where patient_table.DoctorID = NEW.DoctorID AND
				patient_table.UserID = NEW.UserID AND
				patient_table.PatientID = NEW.PatientID ;		
    END$$
DELIMITER ;

---------------------------- Trigger 7 -------------------------

DROP TRIGGER Check_Diabetic_Value_Insert;
DELIMITER $$
CREATE TRIGGER  Check_Diabetic_Value_Update AFTER UPDATE ON diabeticmeasure_table

FOR EACH ROW
BEGIN	
	Declare age int;
	Declare FSG double;
    Declare FPG double;
    Declare isDiabetic boolean;
    Declare adviceFSG varchar(100);
    Declare adviceFPG varchar(100);
    Declare SingleStr varchar(200);
    
    Select UserAge from user_table where user_table.UserID = NEW.UserID into age;
    
    Select PatientIsDiabetic from patient_table 
    where patient_table.UserID = NEW.UserID AND 
    patient_table.PatientID = NEW.PatientID AND
    patient_table.DoctorID = NEW.DoctorID
    into isDiabetic;
        
		IF isDiabetic THEN
			call GetDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);	
			
		ELSE
			call GetNonDiabeticRange(age, @MaxFSG, @MinFSG, @MaxFPG, @MinFPG);
			
		END IF;
		
		IF NEW.DiabeticMeasureFSGLevel > @MinFSG AND NEW.DiabeticMeasureFSGLevel < @MaxFSG THEN
				SET adviceFSG = 'FSG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel <= @MinFSG THEN
				SET adviceFSG = 'FSG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFSGLevel >= @MaxFSG THEN
				SET adviceFSG = 'FSG is overshooting or closer to Higher limits.' ;
			END IF;
			
		IF NEW.DiabeticMeasureFPGLevel > @MinFPG AND NEW.DiabeticMeasureFPGLevel < @MaxFPG THEN
				SET adviceFPG = 'FPG is well in Limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel <= @MinFPG THEN
				SET adviceFPG = 'FPG is under or closer to lower limits.' ;
						
			ELSEIF NEW.DiabeticMeasureFPGLevel >= @MaxFPG THEN
				SET adviceFPG = 'FPG is overshooting or closer to Higher limits.' ;
		END IF;
		
		IF isDiabetic THEN
			SET SingleStr = concat_ws(' ','Diabetic:', adviceFSG, adviceFPG);    
		ELSE
			SET SingleStr = concat_ws(' ','Non-Diabetic:', adviceFSG, adviceFPG);
			
		END IF;
		
		update patient_table Set PatientSystemSuggestion = SingleStr
				where patient_table.DoctorID = NEW.DoctorID AND
				patient_table.UserID = NEW.UserID AND
				patient_table.PatientID = NEW.PatientID ;
END$$

DELIMITER ;

---------------------------- Trigger 8 -------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER  Archive_After_UserTbl_Update AFTER UPDATE ON user_table

FOR EACH ROW
BEGIN	

	insert into userhistory_table(
		userhistory_table.UserName,
		userhistory_table.UserAddress,
		userhistory_table.UserCity,
		userhistory_table.UserZipCode,
		userhistory_table.UserPhoneNumber,
		userhistory_table.UserDOB,
		userhistory_table.UserAge,
		userhistory_table.UserGender,
		userhistory_table.UserUpdatedBy,
		userhistory_table.Userupdatedate,
		userhistory_table.UserID)
    values
    (	OLD.UserName,
		OLD.UserAddress,
		OLD.UserCity,
		OLD.UserZipCode,
		OLD.UserPhoneNumber,
		OLD.UserDOB,
		OLD.UserAge,
		OLD.UserGender,
		user(),
		curdate(),
		OLD.UserID);
                                    
END$$

DELIMITER ;

alter table diabeticmeasure_table
modify column DiabeticMeasuresDate datetime;

DROP TRIGGER Add_AGE_After_AthleteTable_Insert;

INSERT INTO `athlete_table` VALUES (1,181,136,18.68,'2015-12-01 00:00:00',12),
(2,189,188,23.68,'2015-12-01 00:00:00',7),
(3,194,165,19.73,'2015-12-01 00:00:00',8),
(4,178,124,17.61,'2015-12-01 00:00:00',4),
(5,174,120,17.84,'2015-11-28 00:00:00',15),
(6,186,150,19.51,'2015-12-01 00:00:00',11),
(7,182,164,22.28,'2015-11-09 00:00:00',18),
(8,188,176,22.41,'2015-10-10 00:00:00',2),
(9,185,166,21.83,'2015-12-02 00:00:00',16),
(10,176,130,18.89,'2015-12-02 00:00:00',3),
(11,180,140,19.44,'2015-12-02 00:00:00',13);

INSERT INTO `activity_table` VALUES 
(2,5,59,'2015-12-03 00:00:00',220,1,12,3),
(1.8,7,650,'2015-12-01 00:00:00',130,1,12,5),
(0.5,12,160,'2015-04-20 00:00:00',120,2,7,1),
(10,10,132,'2015-10-16 00:00:00',140,2,7,2),
(NULL,9,71,'2015-11-08 00:00:00',165,2,7,4),
(5,15,NULL,'2015-12-01 00:00:00',146,3,8,2),
(NULL,18,NULL,'2015-10-28 00:00:00',125,4,4,4),
(2.4,20,NULL,'2015-11-28 00:00:00',147,5,15,3),
(0.2,18,NULL,'2015-11-20 00:00:00',123,6,11,1),
(11,31,NULL,'2015-11-30 00:00:00',147,6,11,2),
(1.4,36,NULL,'2015-11-29 00:00:00',178,6,11,3),
(21,10,NULL,'2015-11-30 00:00:00',166,7,18,2),
(NULL,42,NULL,'2015-11-11 00:00:00',180,7,18,4),
(NULL,14,NULL,'2015-11-30 00:00:00',155,8,2,4),
(1.3,12,NULL,'2015-11-30 00:00:00',148,8,2,5),
(1.1,19,NULL,'2015-12-01 00:00:00',123,9,16,3),
(0.8,30,NULL,'2015-12-02 00:00:00',120,10,3,1),
(6,24,NULL,'2015-12-02 00:00:00',168,10,3,2),
(NULL,26,NULL,'2015-12-02 00:00:00',181,10,3,4),
(4,34,NULL,'2015-11-30 00:00:00',145,11,13,5);

Alter table alldevices_table
Drop column userID;

Alter table alldevices_table
drop foreign key uses;

INSERT INTO `clinic_table` VALUES 
(101,'Joslin Diabetes Center','1 Joslin Place','Boston','2215',1),
(102,'Mass General Hospital','50 Staniford Street #340','Boston','2114',2),
(103,'Boston Medical Center',' 840 Harrison Avenue','Boston','2118',3),
(104,'Women\'s Health Services','111 Harvard Street','Brookline','2446',4),
(105,'The Doc Is In','581 Boylston Street #800','Boston','2116',5),
(106,'Mount Auburn Hospital','330 Mount Auburn Street','Cambridge','2138',6),
(107,'Dr. Boris I. Orkin','1180 Beacon Street #5B','Brookline','2446',7),
(108,'Whittier Street Health Center','1290 Tremont Street','Boston','2120',8),
(109,'Total Wellness Clinic','697 Cambridge Street','Brighton','2135',9),
(110,'Sharewood Project','184 Pleasant Street','Malden','2148',10);



INSERT INTO `diabeticmeasure_table` VALUES 
(10.55,160.4,'2015-12-07 01:24:15',1,19,1),
(10.9,174.38,'2015-12-07 01:24:15',2,13,2),
(6.8,104.94,'2015-12-07 01:24:15',3,14,3),
(9.81,190.22,'2015-12-07 01:24:15',4,4,4),
(10.34,140.1,'2015-12-07 01:24:15',5,8,5),
(10.64,173.44,'2015-12-07 01:24:15',6,12,6),
(10.49,160.84,'2015-12-07 01:24:15',7,5,7),
(5.01,190.22,'2015-12-07 01:24:15',8,6,8),
(10.55,170.32,'2015-12-07 01:24:15',9,17,9),
(10.5,200.1,'2015-12-07 01:24:15',10,9,10);

Alter table patient_table
MODIFY column PatientSystemSuggestion varchar(300);

INSERT INTO patient_table(patientID, PatientIsDiabetic,UserID,DoctorID, PatientSystemSuggestion) VALUES 
(4,1,4,4,'Diabetic: FSG is well in Limits. FPG is well in Limits.'),
(7,1,5,7,'Diabetic: FSG is overshooting or closer to Higher limits. FPG is well in Limits.'),
(8,0,6,8,'Non-Diabetic: FSG is under or closer to lower limits. FPG is overshooting or closer to Higher limits.'),
(5,1,8,5,'Diabetic: FSG is well in Limits. FPG is well in Limits.'),
(10,1,9,10,'Diabetic: FSG is well in Limits. FPG is overshooting or closer to Higher limits.'),
(6,1,12,6,'Diabetic: FSG is overshooting or closer to Higher limits. FPG is well in Limits.'),
(2,1,13,2,'Diabetic: FSG is well in Limits. FPG is well in Limits.'),
(3,0,14,3,'Non-Diabetic: FSG is overshooting or closer to Higher limits. FPG is overshooting or closer to Higher limits.'),
(9,1,17,9,'Diabetic: FSG is well in Limits. FPG is well in Limits.'),
(1,1,19,1,'Diabetic: FSG is well in Limits. FPG is well in Limits.');


INSERT INTO `treatment_table` VALUES 
(2001,3,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',1),
(2002,5,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',2),
(2003,8,'Low Sugar levels. Pramlintide (Symlin) is continued',3),
(2004,1,'Cholesterol lowering drugs are prescribed by Doctor danziman. Case of HyperGlycemia',4),
(2005,3,'Hypoglycemia. Physical activity is suggested.',5),
(2006,2,'Continuous monitoring has shown good signs and same medications are continued.',6),
(2007,1,'Hypoglycemia. Physical activity is suggested.',7),
(2008,4,'case of Hypoglycemia  Patient shows sweting, fatiguee and mood swining.',8),
(2009,6,'Low Sugar levels. Pramlintide (Symlin) is continued',9),
(2010,6,'Case of HyperGlycemia. Patient has high blood pressure and symptoms of nausea',10);


INSERT INTO `doctor_table` VALUES 
(1,'Joseph Avruch','6138928989'),
(2,'Lloyd Axelrod','6170023020'),
(3,'Enrico Cagliero','8170035689'),
(4,'John Elliott Godine','9782562323'),
(5,'Mara Lorenzi','6178988989'),
(6,'David Nathan','9876541235'),
(7,'Steven Jon Russell','6178923636'),
(8,'Enrico Cagliero','6178989999'),
(9,'James Benjamin Meigs','6176176178'),
(10,'David Nathan','6178729292');



alter table patienthistory_table
add column PatientSystemSuggestion varchar(300);

---------------------------- Trigger 9 -------------------------

DELIMITER $$
CREATE TRIGGER  Archeive_Patient_Record_Update AFTER UPDATE ON patient_table

FOR EACH ROW
BEGIN				
    Declare docName varchar(50);
    Select Doctorname from doctor_table where DoctorID = old.DoctorID into docName;
    
    IF OLD.PatientIsDiabetic <> NEW.PatientIsDiabetic THEN
		insert into patienthistory_table(        
			patienthistory_table.PatientHistoryID,
			patienthistory_table.PatientDoctorName,
			patienthistory_table.PatientIsDiabetic,
			patienthistory_table.PatientUpdatedBy,
			patienthistory_table.PatientUpdateDate,
			patienthistory_table.PatientSystemSuggestion,
			patienthistory_table.PatientID,
			patienthistory_table.UserID,
			patienthistory_table.DoctorID)
		values
		(	DEFAULT,
			docName,
			OLD.PatientIsDiabetic,
			user(),
			curdate(),
			OLD.PatientSystemSuggestion,
			OLD.PatientID,
			OLD.UserID,
			OLD.DoctorID);
		
	END IF;
    END$$

DELIMITER ;



----Create Users and GRANT or REVOKE table access -------------------------

Create USER 'admin' @'localhost' identified by 'admin';
GRANT ALL privileges ON monitorhealth.* to 'admin' @'localhost';

Create USER 'patient' @'localhost' identified by 'patient';
Create USER 'doctor' @'localhost' identified by 'doctor';
Create USER 'athlete' @'localhost' identified by 'athlete';

GRANT UPDATE, INSERT ON monitorhealth.user_table to 'patient' @'localhost';
GRANT SELECT ON monitorhealth.patient_table to 'patient' @'localhost';
GRANT SELECT,INSERT ON monitorhealth.diabeticmeasure_table to 'patient' @'localhost';
GRANT SELECT ON monitorhealth.treatment_table to 'patient' @'localhost';

GRANT UPDATE, INSERT ON monitorhealth.user_table to 'athlete' @'localhost';
GRANT SELECT,INSERT,UPDATE ON monitorhealth.athlete_table to 'athlete' @'localhost';
GRANT SELECT,INSERT,UPDATE ON monitorhealth.activity_table to 'athlete' @'localhost';
GRANT SELECT ON monitorhealth.remedy_table to 'athlete' @'localhost';

GRANT SELECT ON monitorhealth.user_table to 'doctor' @'localhost';
GRANT SELECT, UPDATE ON monitorhealth.patient_table to 'doctor' @'localhost';
GRANT SELECT, INSERT, UPDATE ON monitorhealth.doctor_table to 'doctor' @'localhost';
GRANT SELECT, INSERT, UPDATE ON monitorhealth.clinic_table to 'doctor' @'localhost';
GRANT SELECT, INSERT, UPDATE ON monitorhealth.treatment_table to 'doctor' @'localhost';



SELECT user_table.UserID, athlete_table.AthleteID, UserName, AthleteHeight, athleteweight, athletebmi, ActivityName, ActivityCaloriesBurnt,
RemedyDescription
From user_table INNER JOIN athlete_table 
 ON user_table.UserID = athlete_table.UserID
 INNER JOIN activity_table ON
 athlete_table.AthleteID = activity_table.AthleteID INNER JOIN
 allactivity_table ON activity_table.ActivityID = allactivity_table.ActivityID INNER JOIN remedy_table ON
activity_table.AthleteID = remedy_table.AthleteID AND activity_table.userID = remedy_table.userID INNER JOIN allremedy_table ON
allremedy_table.RemedyID = remedy_table.RemedyID;


SELECT user_table.UserID, patient_table.patientID, UserName, PatientIsDiabetic, PatientSystemSuggestion, DoctorName, TreatmentDescription
From user_table INNER JOIN patient_table 
 ON user_table.UserID = patient_table.UserID
 INNER JOIN doctor_table ON
 patient_table.DoctorID = doctor_table.DoctorID INNER JOIN
 treatment_table ON doctor_table.DoctorID = treatment_table.DoctorID;
 

 SELECT * FROM diabeticmeasure_table;
 
 update diabeticmeasure_table SET DiabeticMeasureFPGLevel = 104.3 where PatientID = 5 AND UserID = 8 AND DoctorID = 5;
 select* from patient_table;
 select * from diabeticmeasure_table; 



