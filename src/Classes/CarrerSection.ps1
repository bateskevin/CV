Class CarrerSetion {
    [string]$Employer
    [string]$JobTitle
    [string]$JobDescription
    [datetime]$StartDate
    [datetime]$EndDate

    CarrerSetion([string]$Employer,[string]$JobTitle, [string]$JobDescription, [datetime]$StartDate, [datetime]$EndDate){
        $this.Employer = $Employer
        $this.JobTitle = $JobTitle
        $this.JobDescription = $JobDescription
        $this.StartDate = $StartDate
        $this.EndDate = $EndDate
    }
}