Class Skill {
    [string]$Name
    [string]$Type
    [string]$Description
    [int]$SkillRatingOutOfFive
    [int]$ExpirienceInYears

    Skill([string]$Name,[string]$Type, [string]$Description, [int]$SkillRatingOutOfFive ,[int]$ExpirienceInYears){
        $this.Name = $Name
        $this.Type = $Type
        $this.Description = $Description
        $this.SkillRatingOutOfFive = $SkillRatingOutOfFive
        $this.ExpirienceInYears = $ExpirienceInYears
    }
}