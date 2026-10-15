@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-07'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z22_CustomerWithTravels
  as select from Z22_Customer
  association [0..*] to Z22_Travel as _Travels on _Travels.CustomerId = $projection.CustomerId
{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      _Travels
}
where
  CountryCode = 'DE'
