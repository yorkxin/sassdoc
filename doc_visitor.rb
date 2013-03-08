require 'ostruct'
require 'sass'
require './records'

class DocVisitor < Sass::Tree::Visitors::Base
  protected
  def initialize
    @records = Records.new
  end

  def visit_root(node)
    yield
    return @records
  end

  def visit_comment(node)
    @records.record_comment(node)
  end

  def visit_import(node)
    @records.record_import(node)
  end

  def visit_mixin(node)
    @records.record_mixin(node)
  end

  def visit_mixindef(node)
    @records.record_mixindef(node)
  end

  def visit_variable(node)
    @records.record_variable(node)
  end
end
