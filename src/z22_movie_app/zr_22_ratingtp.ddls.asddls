@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie App'

define view entity ZR_22_RatingTP as select from ZI_22_RATING
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate
}
