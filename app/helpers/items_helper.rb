module ItemsHelper

  def format_categories(categories)

    links = categories.map do |c|
      link_to c.title, category_path(c), class: "link"
    end

    links.to_sentence.html_safe

  end

end
