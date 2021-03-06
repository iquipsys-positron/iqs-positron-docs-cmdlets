########################################################
##
## Rosters.ps1
## Management interface to IQuipsys tracker
## Rosters commands
##
#######################################################


function Get-IqsRosters
{
<#
.SYNOPSIS

Gets page with rosters by specified criteria

.DESCRIPTION

Gets a page with rosters that satisfy specified criteria

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Filter

A filter with search criteria (default: no filter)

.PARAMETER Skip

A number of records to skip (default: 0)

.PARAMETER Take

A number of records to return (default: 100)

.PARAMETER Total

A include total count (default: false)

.EXAMPLE

Get-IqsRosters -SiteId 1 -Take 10

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$false, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Filter = @{},
        [Parameter(Mandatory=$false, Position = 2, ValueFromPipelineByPropertyName=$true)]
        [int] $Skip = 0,
        [Parameter(Mandatory=$false, Position = 3, ValueFromPipelineByPropertyName=$true)]
        [int] $Take = 100,
        [Parameter(Mandatory=$false, Position = 4, ValueFromPipelineByPropertyName=$true)]
        [bool] $Total
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/rosters" -f $SiteId

        $params = $Filter +
        @{ 
            skip = $Skip;
            take = $Take
            total = $Total
        }

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route -Params $params

        Write-Output $result.Data
    }
    end {}
}


function Get-IqsRoster
{
<#
.SYNOPSIS

Gets roster by id

.DESCRIPTION

Gets roster by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A roster id

.EXAMPLE

Get-IqsRoster -SiteId 1 -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/rosters/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqsRoster
{
<#
.SYNOPSIS

Creates a new roster

.DESCRIPTION

Creates a new roster

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Roster

A roster with the following structure:
- id: string
- site_id: string
- name: string
- shift_id: string
- start_date: Date
- start_time: Date
- end_time: Date
- objects: RosterObjectV1[]
  - object_id: string
  - assign_id: string
  - planned: boolean
  - actual: boolean
  - start_time: Date
  - end_time: Date

.EXAMPLE

New-IqsRoster -SiteId 1 -Roster @{ site_id="1"; name="Entire day"; start_date=@(Get-Date) }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Roster
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/rosters" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Roster
        
        Write-Output $result
    }
    end {}
}


function Update-IqsRoster
{
<#
.SYNOPSIS

Creates a new roster

.DESCRIPTION

Creates a new roster

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Roster

A roster with the following structure:
- id: string
- site_id: string
- name: string
- shift_id: string
- start_date: Date
- start_time: Date
- end_time: Date
- objects: RosterObjectV1[]
  - object_id: string
  - assign_id: string
  - planned: boolean
  - actual: boolean
  - start_time: Date
  - end_time: Date

.EXAMPLE

Update-IqsRoster -SiteId 1 -Roster  @{ site_id="1"; name="Entire day"; start_date=@(Get-Date) }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Roster
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/rosters/{1}" -f $SiteId, $Roster.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Roster
        
        Write-Output $result
    }
    end {}
}


function Remove-IqsRoster
{
<#
.SYNOPSIS

Removes roster by id

.DESCRIPTION

Removes roster by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A roster id

.EXAMPLE

Remove-IqsRoster -SiteId 1 -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/rosters/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}
