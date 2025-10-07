module ActionTextHelper
    def action_text_links_new_tab(rich_text_or_html)
        html = if defined?(ActionText::RichText) && rich_text_or_html.is_a?(ActionText::RichText)
        rich_text_or_html.body.to_s
        else
        rich_text_or_html.to_s
        end

        # Parse and update links
        fragment = Nokogiri::HTML::DocumentFragment.parse(html)
        fragment.css('a').each do |a|
        a.set_attribute('target', '_blank')
        # Merge rel values and ensure noopener and noreferrer are present
        rel_values = (a.get_attribute('rel') || '').split(/\s+/)
        rel_values |= %w[noopener noreferrer]
        a.set_attribute('rel', rel_values.join(' '))
        end

        fragment.to_html.html_safe
    end
end