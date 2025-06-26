module SearchKickHelper
  def es_downloads(id)
    response = get_response(id)
    response["_source"]["downloads"]
  end

  def es_version_downloads(id)
    response = get_response(id)
    response["_source"]["version_downloads"]
  end

  def get_response(id)
    Rubygem.searchkick_index.refresh
    Searchkick.client.get index: Gemcutter::SEARCH_INDEX_NAME, id: id
  end
end
