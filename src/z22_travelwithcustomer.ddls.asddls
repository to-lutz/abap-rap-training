@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-03'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z22_TravelWithCustomer
  as select from Z22_Customer                                                         as customer
    inner join   Z22_Travel                                                           as travel  on  customer.CustomerId  = travel.CustomerId
                                                                                                 and customer.CountryCode = 'DE'
{
  key customer.CustomerId,
  key travel.TravelId,
      customer.FirstName,
      customer.LastName,
      customer.Title,

      customer.Street,
      customer.PostalCode,
      customer.City,
      travel.AgencyId,
      travel.BeginDate,
      travel.EndDate,

      dats_days_between(travel.BeginDate, travel.EndDate) + 1 as Duration,

      case when customer.Title is initial then concat_with_space(customer.FirstName, customer.LastName, 1)
           else concat_with_space(concat_with_space(customer.Title, customer.FirstName, 1), customer.LastName, 1)
      end                                                     as CustomerName,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount => travel.BookingFee,
                           source_currency => travel.CurrencyCode,
                           target_currency => cast('EUR' as abap.cuky),
                           exchange_rate_date => $session.system_date
                         )                                    as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount => travel.TotalPrice,
                           source_currency => travel.CurrencyCode,
                           target_currency => cast('EUR' as abap.cuky),
                           exchange_rate_date => $session.system_date
                         )                                    as TotalPrice,

      cast('EUR' as abap.cuky)                                as CurrencyCode,
      travel.Description
}
