@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie App'

define root view entity ZI_22_Movie
  as select from zabap_movie_a

{
  key movie_uuid      as MovieUuid,

      title           as Title,
      genre           as Genre,
      publishing_year as PublishingYear,
      runtime_in_min  as RuntimeInMin,
      @Semantics.imageUrl: true
      image_url       as ImageUrl,

      /* Administrative Data */
      created_at      as CreatedAt,
      created_by      as CreatedBy,
      last_changed_at as LastChangedAt,
      last_changed_by as LastChangedBy
}
