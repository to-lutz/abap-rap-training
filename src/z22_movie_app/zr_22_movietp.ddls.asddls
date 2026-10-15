@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie App'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZR_22_MovieTP
  as select from ZI_22_Movie

  association [0..1] to ZI_22_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUUID
  association [0..1] to ZI_22_GenreText     as _GenreText     on $projection.Genre = _GenreText.Genre
  composition [0..*] of ZI_22_RATING     as _Ratings
{
  key MovieUuid,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,

      /* Administrative Data */
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Associations */

      _AverageRating,
      _GenreText,
      _Ratings
}
