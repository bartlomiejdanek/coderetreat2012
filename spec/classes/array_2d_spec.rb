require 'spec_helper'

describe Array2D do

  it "set value" do
    array_2d = Array2D.new(2)
    array_2d[1,1] = 3
    array_2d.rows[1][1].should == 3
  end

  it "get value" do
    array_2d = Array2D.new(2)
    array_2d[1,1] = 3
    array_2d[1,1].should == 3
  end

  it "reversed" do
    _array_2d = Array2D.new { [[0,1], [2,3]] }

    reversed_rows = _array_2d.reversed.rows
    reversed_rows.should == [[2,3], [0,1]]
  end

  it "columns" do
    _array_2d_columns = Array2D.new { [[0,1], [2,3]] }.columns
    _array_2d_columns.should == [[0,2],[1,3]]
  end

end
