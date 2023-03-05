Class CV {
    [Metadata]$Metadata
    [Skill[]]$Skills
    [CarrerSetion[]]$CarreerSections
    [CommunityDue[]]$CommunityDues

    CV([Metadata]$Metadata,[Skill[]]$Skills,[CarrerSetion[]]$CarreerSections,[CommunityDue[]]$CommunityDues) {
        $this.Metadata = $Metadata
        $this.Skills = $Skills
        $this.CarreerSections = $CarreerSections
        $this.CommunityDues = $CommunityDues
    }

    [void] DisplayCVHeader(){
        Write-Host @"
#################################################################
|                                                               |
|                        CV - Kevin Bates                       |
|                                                               |
#################################################################

"@ -ForegroundColor Cyan

    }

    [void]DisplayMetadata(){
            Write-Host @"
    Name:          $($this.Metadata.Name)
    Date of Birth: $($this.Metadata.DateOfBirth.ToString())
    Nationality:   $($this.Metadata.Nationality)
    Languages:     $($this.Metadata.Languages)
    PhoneNumber:   $($this.Metadata.PhoneNumber)
    Email:         $($this.Metadata.Email)
    Address:       $($this.Metadata.Address)
    Introduction:  $($this.Metadata.Introduction)

"@
    }

    [void]DisplaySkillHeader(){
        Write-Host @"

|--------------------------- Skills -----------------------------|

"@ -ForegroundColor Cyan
    }

    [void]DisplaySkills(){
        Foreach($Skill in $this.Skills){
            Write-Host @"
    Skill:               $($Skill.Name)
    Description:         $($Skill.Description)
    Years of Expirience: $($Skill.ExpirienceInYears.ToString())
    Level (1 - 5):       $(
        Switch($Skill.SkillRatingOutOfFive){
            1 {"*"}
            2 {"* *"}
            3 {"* * *"}
            4 {"* * * *"}
            5 {"* * * * *"}
        }
    ) 

"@
        }
    }

    [void]DisplayCarreerHeader(){
        Write-Host @"

|--------------------------- Carreer ----------------------------|

"@ -ForegroundColor Cyan
    }

    [void]DisplayCarreer(){
        Foreach($Step in $this.CarreerSections){
            Write-Host @"
    Employer:        $($Step.Employer)
    Job Title:       $($Step.JobTitle)
    Job Description: $($Step.JobDescription)
    Start Date:      $($Step.StartDate.ToString())
    End Date:        $($Step.EndDate.ToString())  
    
"@
        }
    }

    [void]DisplayCommunityHeader(){
        Write-Host @"

|----------------------- Community Work -------------------------|

"@ -ForegroundColor Cyan
    }

    [void]DisplayCommunityWork(){
        Foreach($Due in $this.CommunityDues){
            Write-Host @"
    Type:        $($Due.Type)
    Description: $($Due.Description)
    Link:        $($Due.Link)  
    
"@
        }
    }

    [void] DisplayCV(){
        $this.DisplayCVHeader()
        $this.DisplayMetadata()
        $this.DisplaySkillHeader()
        $this.DisplaySkills()
        $this.DisplayCarreerHeader()
        $this.DisplayCarreer()
        $this.DisplayCommunityHeader()
        $this.DisplayCommunityWork()

        Write-Host 'To check out the structure of the Object run "$CV = Get-KevinBates -Mode ExploreObjectMyself"' -ForegroundColor Yellow
    }
}