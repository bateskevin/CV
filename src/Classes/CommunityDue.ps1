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