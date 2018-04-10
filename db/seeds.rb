# ruby encoding: utf-8


# User(id: integer, uname: string, fname: string, lname: string, city: string, email: string,password:string)
user_list = [
["K","Keisan","Gittens", "Philadelphia", "keisangittens@gmail.com","password"],
["J-Sno","Jon", "Snow","Winterfell","itsyaboi_jonsnow@gmail.com","password"],
["Nardgohard","Bernard","Lowe","Westworld","am_i_a_robot@gail.com","password"],
["Rob","Robert","Ford","Margam","robert_ford_god@gmail.com","password"],
["Deepak Oprah","Oprah","Winfrey","Kosciusko","oprah_winfrey@yahoo.com","password"],
["Chris","Christina","Scholfield", "Philadelphia", "scholfield@yahoo.com","password"]
]
user_list.each do |uname,fname,lname,city,email,password|
User.create(uname: uname, fname: fname,lname: lname,city: city, email: email,password:password)
end




# Blog(id: integer, title: text, blogpost: text, date_created: timestamps)
blog_posts = [
["Entree","First Timer","Hi this is my first time posting on this website. I'm a cook from Georgia and I love sharing my recipes. My favorite meal is cup ramen noodles with beef tenderloin!",1],
["Drinks/Cocktails","Spiked Lemonade","This spiked lemonade recipe has a slight twist and a lot of bourbon!",2],
["Deserts","Banada Bread","Can anyone help me with this banana bread I'm making? It's too squishy and not the right texture :(",3],
["Entree","TurnIP", "Any vegetarians in the house??? Well, you'll love this recipe- 'TURNIP THE VOLUME!'"],
["Appetizer","Haas_Many: Avocado","Shake that hass! - avocado smooothie to die for!",4],
["Entree","lorem", "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim nulla asperiores possimus, eligendi alias illo vel atque voluptatibus necessitatibus eaque minima tenetur quam adipisci dolorem ratione, quo! Perferendis porro, beatae.",5],
["Deserts","Ipsum","Lorem ipsum dolor sit amet, consectetur adipisicing elit. In accusantium doloribus ipsum temporibus magni tempora, aliquid eius sapiente, ratione error ex a odit? Totam et doloribus eligendi, tempore nobis eaque.",6]
]
blog_posts.each do |category,title,blogpost,user_id,date_created|
Blog.create(category: category,title: title, blogpost: blogpost,user_id: user_id)
end