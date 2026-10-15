@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-05'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z22_CustomerKPIs
  with parameters 
      P_CITY : /dmo/city
  as select from Z22_TravelWithCustomer 
{
  key CustomerId,
      CustomerName,
      Street,
      PostalCode,
      City,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice + BookingFee) as TotalRevenue,
      CurrencyCode,
      avg(Duration as abap.dec(16) ) as AverageDuration,
      count(distinct AgencyId) as NumberOfDifferentAgencys
}
where City = $parameters.P_CITY
group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode
having sum(TotalPrice + BookingFee) >= 5000
