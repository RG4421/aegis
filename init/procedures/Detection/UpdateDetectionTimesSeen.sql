DROP PROCEDURE IF EXISTS `UpdateDetection`;

CREATE PROCEDURE `UpdateDetection` (_DeviceID NVARCHAR(36), _VulnID NVARCHAR(36), _Port INT, _Protocol VARCHAR(36), _ExceptionID VARCHAR(36), _TimesSeen INT, _StatusID INT, _LastFound DATETIME, _LastUpdated DATETIME, _DefaultTime DATETIME)
    #BEGIN#
UPDATE Detection D
SET D.TimesSeen = _TimesSeen, Updated = NOW(), DetectionStatusId = _StatusID, IgnoreID = NULLIF(_ExceptionID, ''), LastFound = NULLIF(_LastFound, _DefaultTime), LastUpdated = NULLIF(_LastUpdated, _DefaultTime)
WHERE D.DeviceID = _DeviceID AND D.VulnerabilityID = _VulnID AND D.Port = _Port AND D.Protocol = _Protocol;