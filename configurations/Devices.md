Page navigation

* [Get worksite devices](#devices)
* [Get device info](#device)
* [Create device](#new-device)
* [Update device](#edit-device)
* [Delete device](#delete-device)
* [Ping device](#ping-device)

---

# <a name="devices">Get-IqsDevices</a>
   
### Description

Gets page with devices by specified criteria
    
### Syntax

    Get-IqsDevices [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsDevices -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba

---

# <a name="device">Get-IqsDevice</a>

### Description

Gets device by id
    
### Syntax

    Get-IqsDevice [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A device id. Required parameter. Can be retrieved from Get-IqsDevices

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsDevice -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-device">New-IqsDevice</a>

### Description

Creates new device
    
### Syntax

    New-IqsDevice [-Connection < Hashtable >] [-SiteId] < String > [-Device] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Device < Object >

    Required parameter. A device with the following structure:
    
        - id: string
        - site_id: string
        - type: string
        - version: number
        - udi: string
        - label: string
        - create_time: Date
        - active: < Boolean >
        - deleted: < Boolean >
        - object_id: string

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>New-IqsDevice -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Device @{ site_id="9cfaf79bc95b4a9e912314eb3db7a4ba"; model="simulated"; udi="0001"; label="Device01"; active=$true }

---

# <a name="edit-device">Update-IqsDevice</a>
 
### Description

Updates existing device
    
### Syntax

    Update-IqsDevice [-Connection < Hashtable >] [-SiteId] < String > [-Device] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Device < Object >

    Required parameter. A device with the following structure:
    
        - id: string
        - site_id: string
        - type: string
        - version: number
        - udi: string
        - label: string
        - create_time: Date
        - active: < Boolean >
        - deleted: < Boolean >
        - object_id: string

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqsDevice -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Device @{ site_id="9cfaf79bc95b4a9e912314eb3db7a4ba"; model="simulated"; udi="0001"; label="Device01"; active=$true }

---

# <a name="delete-device">Remove-IqsDevice</a>
    
### Description

Deletes existing device
    
### Syntax

    Remove-IqsDevice [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A device id. Required parameter. Can be retrieved from Get-IqsDevices

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Remove-IqsDevice -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="ping-device">Ping-IqsDevice</a>

### Description

Pings an existing device
    
### Syntax

    Ping-IqsDevice [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A device id. Required parameter. Can be retrieved from Get-IqsDevices

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Ping-IqsDevice -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id e0a31d48021e492c8c7d45b17ac36175
