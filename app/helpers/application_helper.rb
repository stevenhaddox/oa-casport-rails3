module ApplicationHelper
  
  def m(markdown_content)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(markdown_content, *options).to_html).html_safe
  end


  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
    
  def flash_messages(div_id='flash_messages', div_clas='')
    div_content = ''
    PlanetArgon::FlashMessageConductor::FLASH_MESSAGE_TYPES.each do |key|
      div_content << render_flash_message(key.to_s, flash[key]) unless flash[key].blank?
    end
    if div_content.blank?
      return ''
    else
      return content_tag('div', div_content.html_safe, :id => div_id, :class => div_class)
    end
  end
  
end
