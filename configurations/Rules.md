Page navigation

* [Get worksite rules](#rules)
* [Get rule info](#rule)
* [Create rule](#new-rule)
* [Update rule](#edit-rule)
* [Delete rule](#delete-rule)

---

# <a name="rules">Get-IqsEventRules</a>
   
### Description

Gets a page with rules that satisfy specified criteria
    
### Syntax

    Get-IqsEventRules [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Filter < Hashtable >

    A filter with search criteria (default: no filter)
        
- Skip < Int32 >

    A number of records to skip (default: 0)
        
- Take < Int32 >

    A number of records to return (default: 100)
        
- Total < Boolean >

    A include total count (default: false)
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.

### Example
    
    C:\PS>Get-IqsEventRules -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ type="object" } -Take 10

---

# <a name="rule">Get-IqsEventRule</a>

### Description

Gets rule by its unique id
    
### Syntax

    Get-IqsEventRule [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A rule id. Required parameter. Can be retrieved from Get-IqsEventRules

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsEventRule -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-rule">New-IqsEventRule</a>

### Description

Creates new rule
    
### Syntax

    New-IqsEventRule [-Connection < Hashtable >] [-SiteId] < String > [-Rule] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Rule < Object >

    Required parameter. A rule with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - type: string
        - condition: any
        - severity: number
        - interval: number
        - incident: boolean
        - send_email: boolean
        - emails: string[]
        - send_signal: boolean
        - signals: number
        - include_object_ids: string[]
        - exclude_object_ids: string[]
        - include_group_ids: string[]
        - exclude_group_ids: string[]
        - include_zone_ids: string[]
        - exclude_zone_ids: string[]

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqsEventRule -SiteId 1 -Rule @{ site_id="1"; type="presence"; name="Present in area"; event_type="auto" }

---

# <a name="edit-rule">Update-IqsEventRule</a>
 
### Description

Updates existing rule
    
### Syntax

    Update-IqsEventRule [-Connection < Hashtable >] [-SiteId] < String > [-Rule] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Rule < Object >

    Required parameter. A rule with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - type: string
        - condition: any
        - severity: number
        - interval: number
        - incident: boolean
        - send_email: boolean
        - emails: string[]
        - send_signal: boolean
        - signals: number
        - include_object_ids: string[]
        - exclude_object_ids: string[]
        - include_group_ids: string[]
        - exclude_group_ids: string[]
        - include_zone_ids: string[]
        - exclude_zone_ids: string[]

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqsEventRule -SiteId 1 -Rule @{ site_id="1"; type="presence"; name="Present in area"; event_type="auto" }

---

# <a name="delete-rule">Remove-IqsEventRule</a>
    
### Description

Deletes existing rule
    
### Syntax

    Remove-IqsEventRule [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A rule id. Required parameter. Can be retrieved from Get-IqsEventRules

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqsEventRule -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2