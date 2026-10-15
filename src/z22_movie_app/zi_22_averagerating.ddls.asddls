@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie App'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_22_AverageRating
  as select from zabap_rating_a

{
  key movie_uuid                    as MovieUUID,

      @EndUserText.label: 'Average Rating'
      @EndUserText.quickInfo: 'Average Rating'
      avg(rating as abap.dec(16,1)) as AverageRating,

      case when avg(rating as abap.dec(16,1)) > 6.7 then 3
           when avg(rating as abap.dec(16,1)) > 3.4 then 2
           when avg(rating as abap.dec(16,1)) > 0 then 1
           else 0
      end                           as AverageRatingCriticality
}

group by movie_uuid
