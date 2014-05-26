class FormExampleController < ApplicationController
  def form_input
  end

  def form_output
  	render text: params.inspect
  end
end
