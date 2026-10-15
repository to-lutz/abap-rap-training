@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie App'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_22_MovieTP
  provider contract transactional_query
  as projection on ZR_22_MovieTP

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      @ObjectModel.text.element: [ 'GenreText' ]
      Genre,

      PublishingYear,
      RuntimeInMin,
      ImageUrl,

      /* Transient Data */
      _AverageRating.AverageRating,
      _AverageRating.AverageRatingCriticality,
      _GenreText.GenreText,

      /* Administrative Data */
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      /* Associations */
      _Ratings : redirected to composition child ZC_22_RatingTP
}
