@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie App'
@Metadata.allowExtensions: true
define view entity ZC_22_RatingTP as projection on ZI_22_RATING
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  /* Associations */
  _Movie : redirected to parent ZC_22_MovieTP
}
