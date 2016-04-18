class HomeController < ApplicationController
    require 'mailgun'
    def sent
        
    end
    
    def result
        @email = params[:email]
        @title = params[:title]
        @content = params[:content]
        
        # Post란 데이터베이스만들자
        # 이전에 만들었던 디비 칼럼이름
        new_post = Post.new
        new_post.title = @title
        new_post.content = @content
        new_post.save
        
        mg_client = Mailgun::Client.new("key-ce69d5638ef7b89ff45660a4bc75577e")

        message_params =  {
                           from: 'admin@gmail.com',
                           to:   @email,
                           subject: @title,
                           text:    @content
                          }
        
        result = mg_client.send_message('sandbox58bb4842b00e4e24a026e6ceef8a6b8b.mailgun.org', message_params).to_h!
        
        message_id = result['id']
        message = result['message']
        redirect_to "/list"
    end
    
    def list
        @every_post = Post.all.order("id desc")
    end
    
    def destroy
       @one = Post.find(params[:pid])
       @one.destroy
       redirect_to "/list"
    end
    def update_view
        @one = Post.find(params[:pid])
    end

    def siljae
        @one = Post.find(params[:pid])
        @one.title = params[:title]
        @one.content = params[:content]
        @one.save
        redirect_to "/list"
    end
    
end
