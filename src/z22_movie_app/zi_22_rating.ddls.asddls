@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie App'
define view entity ZI_22_RATING as select from zabap_rating_a
association to parent ZR_22_MovieTP as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key rating_uuid as RatingUuid,
  movie_uuid as MovieUuid,
  user_name as UserName,
  rating as Rating,
  rating_date as RatingDate,
  _Movie
}
