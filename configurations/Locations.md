Page navigation

* [Get worksite locations](#locations)
* [Get location info](#location)
* [Create location](#new-location)
* [Update location](#edit-location)
* [Delete location](#delete-location)

---

# <a name="locations">Get-IqtLocations</a>
   
### Description

Gets a page with locations that satisfy specified criteria
    
### Syntax

    Get-IqtLocations [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Filter < Hashtable >

    A filter with search criteria (default: no filter)
        
- Skip < Int32 >

    A number of records to skip (default: 0)
        
- Take < Int32 >

    A number of records to return (default: 100)
        
- Total < < Boolean > >

    A include total count (default: false)
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.

### Example
    
    C:\PS>Get-IqtLocations -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ name="gate" } -Take 10

---

# <a name="location">Get-IqtLocation</a>

### Description

Gets location by its unique id
    
### Syntax

    Get-IqtLocation [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A location id. Required parameter. Can be retrieved from Get-IqtLocations

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqtLocation -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-location">New-IqtLocation</a>

### Description

Creates new location
    
### Syntax

    New-IqtLocation [-Connection < Hashtable >] [-SiteId] < String > [-Location] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Location < Object >

    Required parameter. A location with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - pos: any - GeoJSON

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqtLocation -SiteId 1 -Location @{ site_id="1"; name="Main gate"; pos=${ type="Point"; coordinates=@(32.11, -100.45) } }

---

# <a name="edit-location">Update-IqtLocation</a>
 
### Description

Updates existing location
    
### Syntax

    Update-IqtLocation [-Connection < Hashtable >] [-SiteId] < String > [-location] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- location < Object >

    Required parameter. A location with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - pos: any - GeoJSON

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqtLocation -SiteId 1 -Location @{ site_id="1"; name="Main gate"; pos=${ type="Point"; coordinates=@(32.11, -100.45) } }

---

# <a name="delete-location">Remove-IqtLocation</a>
    
### Description

Deletes existing location
    
### Syntax

    Remove-IqtLocation [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A location id. Required parameter. Can be retrieved from Get-IqtLocations

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqtLocation -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2