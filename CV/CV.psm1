#Generated at 03/05/2023 01:16:18 by Kevin Bates
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
Enum CommunityDueType {
    YoutubeVideo
    BlogPost
    ConferenceTalk
    OpenSourceProject
}

Class CommunityDue {
    [CommunityDueType]$Type
    [string]$Description
    [string]$Link

    CommunityDue([CommunityDueType]$Type,[string]$Description, [string]$Link){
        $this.Type = $Type
        $this.Description = $Description
        $this.Link = $Link
    }
}
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
Class Metadata {

    [string]$Name
    [datetime]$DateOfBirth
    [string]$Nationality
    [string[]]$Languages
    [string]$PhoneNumber
    [string]$Email
    [string]$Address
    [string]$Introduction

    Metadata([string]$Name,[datetime]$DateOfBirth, [string]$Nationality, [string[]]$Languages,[string]$PhoneNumber,[string]$Email,[string]$Address, [string]$Introduction){
        $this.Name = $Name
        $this.DateOfBirth = $DateOfBirth
        $this.Nationality = $Nationality
        $this.Languages = $Languages
        $this.PhoneNumber = $PhoneNumber
        $this.Email = $Email
        $this.Address = $Address
        $this.Introduction = $Introduction
    }

    [string] ToString(){
        return "Explore here to get to know my Metadata :-)"
    }
}
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
Function Get-KevinBates {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("DisplayCV","ExploreObjectMyself")]
        $Mode
    )
    
    # Create Instance of Metadata
    $Metadata = [Metadata]::new("Kevin Daniel Bates", (get-date "1996-09-15 22:00"), "Switzerland", @("German", "Swiss-German","English"), "079 197 83 52", "kevin96bates@gmail.com", "Unterdorfstrasse 37, 3072 Ostermundigen", "Hi, I am Kevin Bates. i am a young and hungry engineer. I have been working in the Windows world for 7 Years now and have worked my way up from operating teams to being an important piece in engineering teams. I love coding, specifically Powershell, and have been doing it eversince I started my carreer. Next to work I am a ambitioned hobby musician (I play the piano) and enjoy playing Ice hockey and going out with my friends. I identify myself with the work I do, which is why I want to be proud of everything I deliver.")

    # Define Skills
    $Skills = @()
    $Skills += [Skill]::new("Powershell", "Coding", "Eversince I have started in IT I have automated/scripted tasks to make life easier for operational life, aswell as desigining fully automated/tested processes with Powershell. I started out with Powershell v5 and have evolved from simple Scripts to writing object orientated code in newer releases of Powershell. For examples please check out my Github profile.", 4, 7)
    $Skills += [Skill]::new("Git", "Usage", "Version Control is daily routine for me. I an a heavy git user, I would not go as far tho to say that I am a git expert. Simply a User :)", 3, 5)
    $Skills += [Skill]::new("Configuration as Code", "Design/Implementation", "The last 4 Years I have been heavily involved in designing/implementing/operating environments with config as code.", 4, 4)
    $Skills += [Skill]::new("Ansible", "Design/Implementation", "I have worked with Ansible extensivly the last two years. Implementing many windows specific Ansible Roles, automating ansible components (Inventories, Ansible Modules) with Powershell.", 3, 2)
    $Skills += [Skill]::new("CI/CD", "Design/Implementation", "I have set up CI/CD for deplyoments of Powershell Modules, Powershell Scripts, Chocolatey Packages, Containers among other things.", 3, 3)
    $Skills += [Skill]::new("Code Testing", "Usage", "It is second nature for me to write tests along with my code, to ensure that changes on the code do not break it. For Powershell specifically I do this with Pester.", 3, 4)
    $Skills += [Skill]::new("Software Packaging", "Chocolatey", "I can package software with Chocolatey and ship it.", 3, 3)
    $Skills += [Skill]::new("Artifactory", "Usage", "In our software processes we use artifactory to store different kind of artifacts. Powershell Modules, Scripts, Chocolatey packages and Docker Container Images among other things.", 3, 5)
    $Skills += [Skill]::new("Desired State Configuration", "Design/Implementation", "I have configured and operated different implementations of DSC architectures.", 3, 5)


    # Define CarreerSections
    $CarreerSections = @()
    $CarreerSections += [CarrerSetion]::new("Swisscom Schweiz AG", "ICT Devops Engineer", "Engineering of cloud services. Automating processes in a hybrid backend. Design/Implementation of Configmanagement Systems aswell as writing, supporting and extending multiple Powershell Frameworks.", (get-date "2019-04-01 00:00"), (get-date -f "yyyy-MM-dd hh:mm"))
    $CarreerSections += [CarrerSetion]::new("Swisscom Schweiz AG", "ICT System Manager", "Operating Windows Workload, Incident Management. Implementing Software Installations with Blade Logic/Puppet. More extensive automation tasks with Powershell like automating Patching for customer environments aswell as configuration/package Migrations between different config management tools.", (get-date "2018-01-02 00:00"), (get-date "2019-03-31 00:00"))
    $CarreerSections += [CarrerSetion]::new("Zürcher Kantonalbank", "ICT System Manager", "Operating Windows Workload, Incident Management. Implementing Software Installations with Configuration Manager. Automating small Processes with Powershell.", (get-date "2016-08-01 00:00"), (get-date "2018-01-31 00:00"))

    # Define CommunityDues
    $CommunityDues = @()
    $CommunityDues += [CommunityDue]::new("YoutubeVideo", "CommunityDemo About DockerPester", "https://www.youtube.com/watch?v=Ybkf9aoz3HA")
    $CommunityDues += [CommunityDue]::new("YoutubeVideo", "PSConf Talk about PSHTML - opensource Powershell Module", "https://www.youtube.com/watch?v=Nnfdsa5vdrQ&t=1s")
    $CommunityDues += [CommunityDue]::new("OpenSourceProject", "CHPSUG - Powershell Usergroup that was organized by me over a period of time during covid. Online Meetups with Lighting Demos", "https://bateskevin.github.io/chpsug/")
    $CommunityDues += [CommunityDue]::new("OpenSourceProject", "Personal Blog", "https://bateskevin.github.io/batesbase/")
    $CommunityDues += [CommunityDue]::new("OpenSourceProject", "Open Source Powershell Modules", "https://github.com/bateskevin")

    # Create CV
    $CV = [CV]::new($Metadata,$Skills,$CarreerSections,$CommunityDues)

    switch ($Mode) {
        "DisplayCV" { $CV.DisplayCV() }
        "ExploreObjectMyself" { return $CV }
        default {throw "No mode passed. Please pass either 'DisplayCV' or 'ExploreObjectMyself' with the mode parameter. Display CV will display the whole CV. ExploreObjectMyself will return the Object that is used to generate the data. This could be interessting for you to see the structure of this module :-)"}
    }

}
