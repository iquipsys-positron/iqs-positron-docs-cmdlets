########################################################
##
## SmsSettings.ps1
## Management interface to IQuipsys tracker
## Sms settings commands
##
#######################################################

function Get-IqsSmsSettings
{
<#
.SYNOPSIS

Get user sms settings

.DESCRIPTION

Gets all users sms settings by its id

.PARAMETER Connection

A connection object

.PARAMETER Id

A unique user id

.EXAMPLE

Get-IqsSmsSettings -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        Get-PipSmsSettings -Connection $Connection -Method "Get" -Uri "/api/v1/sms_settings/{0}" -Id $Id
    }
    end {}
}


function Set-IqsSmsSettings
{
<#
.SYNOPSIS

Set user sms settings

.DESCRIPTION

Sets all users sms settings defined by its id

.PARAMETER Connection

A connection object

.PARAMETER Settings

An user sms settings with the following structure
- id: string
- name: string
- phone: string
- language: string
- subscriptions: any
- custom_hdr: any
- custom_dat: any

.EXAMPLE

Set-IqsSmsSettings -Settings @{ id="123"; name="Test user"; phone="+79102340238"; language="en" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Settings
    )
    begin {}
    process 
    {
        Set-PipSmsSettings -Connection $Connection -Method "Put" -Uri "/api/v1/sms_settings/{0}" -Settings $Settings
    }
    end {}
}


function Request-IqsSmsVerification
{
<#
.SYNOPSIS

Requests sms verification message

.DESCRIPTION

Requests a sms verification message by user login

.PARAMETER Connection

A connection object

.PARAMETER Login

User login

.EXAMPLE

Request-IqsSmsVerification -Login test@somewhere.com

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Login
    )
    begin {}
    process 
    {
        Request-PipSmsVerification -Connection $Connection -Method "Post" -Uri "/api/v1/sms_settings/resend" -Login $Login
    }
    end {}
}


function Submit-IqsPhoneVerification
{
<#
.SYNOPSIS

Verifies user phone number

.DESCRIPTION

Verifies user phone number using reset code sent via sms

.PARAMETER Connection

A connection object

.PARAMETER Login

User login

.PARAMETER Code

Reset code

.EXAMPLE

Submit-IqsPhoneVerification -Login test@somewhere.com -Code 1245

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Login,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipelineByPropertyName=$true)]
        [string] $Code
    )
    begin {}
    process 
    {
        Submit-PipPhoneVerification -Connection $Connection -Method "Post" -Uri "/api/v1/sms_settings/verify" -Login $Login -Code $Code
    }
    end {}
}