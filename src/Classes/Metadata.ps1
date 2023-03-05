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