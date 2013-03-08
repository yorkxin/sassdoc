require "sass"
require "./doc_visitor"
require "./doc_renderer"

@renderer = DocRenderer.new

Dir["sample/**/*.scss"].each do |filename|
  payload = Sass::Engine::for_file(filename, {})

  tree = payload.to_tree

  records = DocVisitor.visit(tree)

  @renderer.render(filename, records, STDOUT)
end
