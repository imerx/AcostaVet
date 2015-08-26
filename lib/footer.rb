class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document

  private

  # Renders the content for the footer
  def build_footer
    div :id => "footer" do
      para "Copyright &copy; #{Date.today.year.to_s} #{link_to('veterinariaacosta.com', 'http://veterinariaacosta.com')}. Powered by #{link_to('ActiveAdmin', 'http://www.activeadmin.info')} #{ActiveAdmin::VERSION} #{">>ImerXid<<"}".html_safe
    end
  end

end