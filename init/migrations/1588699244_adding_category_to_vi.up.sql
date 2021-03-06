ALTER TABLE VulnerabilityInfo ADD COLUMN Category VARCHAR(300) NULL AFTER Patchable;
ALTER TABLE VulnerabilityInfoAudit ADD COLUMN Category VARCHAR(300) NULL AFTER Patchable;

DROP TRIGGER VulnerabilityInfoAuditCreateTrigger;
DROP TRIGGER VulnerabilityInfoAuditUpdateTrigger;

CREATE TRIGGER VulnerabilityInfoAuditCreateTrigger BEFORE INSERT ON `VulnerabilityInfo`
    FOR EACH ROW
    INSERT INTO `VulnerabilityInfoAudit` select new.ID, new.SourceVulnId, new.Title, new.VulnerabilityID, new.SourceID, new.CVSS, new.CVSS3, new.Description, new.Threat, new.Solution, new.Patchable, new.Category, new.MatchConfidence, new.MatchReasons, new.Software, new.DetectionInformation, new.Updated, new.Created, 'INSERT', NOW();

CREATE TRIGGER VulnerabilityInfoAuditUpdateTrigger AFTER UPDATE ON `VulnerabilityInfo`
    FOR EACH ROW
    INSERT INTO `VulnerabilityInfoAudit` select new.ID, new.SourceVulnId, new.Title, new.VulnerabilityID, new.SourceID, new.CVSS, new.CVSS3, new.Description, new.Threat, new.Solution, new.Patchable, new.Category, new.MatchConfidence, new.MatchReasons, new.Software, new.DetectionInformation, new.Updated, new.Created, 'UPDATE', NOW();