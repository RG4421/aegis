ALTER TABLE `JobHistory` ADD COLUMN ManualStart BIT NOT NULL DEFAULT b'0';
ALTER TABLE `JobHistory` ADD COLUMN Continuous  BIT NOT NULL DEFAULT b'0';
ALTER TABLE `JobHistory` ADD COLUMN WaitInSeconds INT NOT NULL DEFAULT 600;