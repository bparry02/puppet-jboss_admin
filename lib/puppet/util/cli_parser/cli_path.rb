# Autogenerated from a Treetop grammar. Edits may be lost.


module CliPath
  include Treetop::Runtime

  def root
    @root ||= :path
  end

  module Path0
    def segment
      elements[1]
    end
  end

  module Path1
    def segments
      elements[0]
    end
  end

  module Path2
    def value
      segments.elements.collect { |node| node.segment.value }
    end
  end

  def _nt_path
    start_index = index
    if node_cache[:path].has_key?(index)
      cached = node_cache[:path][index]
      if cached
        node_cache[:path][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      i2, s2 = index, []
      if (match_len = has_terminal?('/', false, index))
        r3 = true
        @index += match_len
      else
        terminal_parse_failure('/')
        r3 = nil
      end
      s2 << r3
      if r3
        r4 = _nt_segment
        s2 << r4
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(Path0)
      else
        @index = i2
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    s0 << r1
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Path1)
      r0.extend(Path2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:path][start_index] = r0

    r0
  end

  module Segment0
    def type
      elements[0]
    end

    def type_name
      elements[2]
    end
  end

  module Segment1
    def value
      {type.text_value => type_name.text_value}
    end
  end

  def _nt_segment
    start_index = index
    if node_cache[:segment].has_key?(index)
      cached = node_cache[:segment][index]
      if cached
        node_cache[:segment][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_type
    s0 << r1
    if r1
      if (match_len = has_terminal?('=', false, index))
        r2 = true
        @index += match_len
      else
        terminal_parse_failure('=')
        r2 = nil
      end
      s0 << r2
      if r2
        r3 = _nt_type_name
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Segment0)
      r0.extend(Segment1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:segment][start_index] = r0

    r0
  end

  def _nt_type
    start_index = index
    if node_cache[:type].has_key?(index)
      cached = node_cache[:type][index]
      if cached
        node_cache[:type][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_identifier

    node_cache[:type][start_index] = r0

    r0
  end

  def _nt_type_name
    start_index = index
    if node_cache[:type_name].has_key?(index)
      cached = node_cache[:type_name][index]
      if cached
        node_cache[:type_name][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_identifier

    node_cache[:type_name][start_index] = r0

    r0
  end

  def _nt_identifier
    start_index = index
    if node_cache[:identifier].has_key?(index)
      cached = node_cache[:identifier][index]
      if cached
        node_cache[:identifier][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?(@regexps[gr = '\A[a-zA-Z_\\.\\-]'] ||= Regexp.new(gr), :regexp, index)
        r1 = true
        @index += 1
      else
        terminal_parse_failure('[a-zA-Z_\\.\\-]')
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:identifier][start_index] = r0

    r0
  end

end

class CliPathParser < Treetop::Runtime::CompiledParser
  include CliPath
end

