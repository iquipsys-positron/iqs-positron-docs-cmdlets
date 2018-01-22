########################################################
##
## Beacons.ps1
## Management interface to IQuipsys tracker
## Beacons commands
##
#######################################################


function Get-IqpBeacons
{
<#
.SYNOPSIS

Gets page with beacons by specified criteria

.DESCRIPTION

Gets a page with beacons that satisfy specified criteria

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

Get-IqpBeacons -SiteId 1 -Take 10

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
        $route = "/api/v1/sites/{0}/beacons" -f $SiteId

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


function Get-IqpBeacon
{
<#
.SYNOPSIS

Gets beacon by id

.DESCRIPTION

Gets beacon by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A beacon id

.EXAMPLE

Get-IqpBeacon -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/beacons/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function Find-IqpPositionByBeacon
{
<#
.SYNOPSIS

Calculate position by beacon udis

.DESCRIPTION

Calculate position by beacon udis

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER BeaconUdi

.EXAMPLE

Find-IqpPositionByBeacon -SiteId 1 -BeaconUdi 00000123, 00000124

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string[]] $BeaconUdi
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/beacons/calculate_position" -f $SiteId
        $params = @{
            site_id=$SiteId;
            udis=$BeaconUdi
        }

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Params $params
        
        Write-Output $result
    }
    end {}
}


function New-IqpBeacon
{
<#
.SYNOPSIS

Creates a new beacon

.DESCRIPTION

Creates a new beacon

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Beacon

A beacon with the following structure:
- id: string
- site_id: string
- udi: string
- label: string
- center: any
- radius: number

.EXAMPLE

New-IqpBeacon -SiteId 1 -Beacon @{ site_id="1"; udi="0000123"; label="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; radius=50 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Beacon
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/beacons" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Beacon
        
        Write-Output $result
    }
    end {}
}


function Update-IqpBeacon
{
<#
.SYNOPSIS

Updates a new beacon

.DESCRIPTION

Updates a new beacon

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Beacon

A beacon with the following structure:
- id: string
- site_id: string
- udi: string
- label: string
- center: any
- radius: number

.EXAMPLE

Update-IqpBeacon -SiteId 1 -Beacon @{ site_id="1"; udi="0000123"; label="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; radius=50 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Beacon
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/beacons/{1}" -f $SiteId, $Beacon.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Beacon
        
        Write-Output $result
    }
    end {}
}


function Remove-IqpBeacon
{
<#
.SYNOPSIS

Removes beacon by id

.DESCRIPTION

Removes beacon by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A beacon id

.EXAMPLE

Remove-IqpBeacon -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/beacons/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}
