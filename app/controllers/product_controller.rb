class ProductController < ApplicationController

    def test
        render json: {
            data: 'Test API'
        }
    end
end
