class Records
  attr_reader :comment_blocks,
              :imported_files,
              :used_mixins,
              :defined_mixins,
              :variables

  def initialize
    @comment_blocks = []
    @imported_files = []
    @used_mixins    = []
    @defined_mixins = []
    @variables      = []
  end

  def record_comment(node)
    comment = node.value.first
    comment.gsub!(/\A\/\*/, ' *').gsub!(/\n?\s?\*\/\Z/, '').gsub!(/^ \*[ ]?/, '')

    @comment_blocks << comment
  end

  def record_import(node)
    @imported_files << node.imported_filename
  end

  def record_mixin(node)
    @used_mixins << { :name => node.name, :args => node.args }
  end

  def record_mixindef(node)
    @defined_mixins << { :name => node.name, :args => node.args }
  end

  def record_variable(node)
    @variables << { :name => node.name, :expr => node.expr }
  end
end
