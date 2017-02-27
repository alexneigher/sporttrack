module UsersHelper

  def sport_icon(sport_name)
    #TODO real icon sets not remote image hacks :(
    sports = {
      rowing: "http://www.iconshock.com/img_vista/IPHONE/transportation/jpg/row_boat_icon.jpg",
      soccer: "https://image.flaticon.com/icons/svg/53/53283.svg",
      football: "https://www.iconexperience.com/_img/i_collection_png/512x512/plain/football.png",
      baseball: "https://d30y9cdsu7xlg0.cloudfront.net/png/561-200.png",
      lacrosse: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Crossed_lacrosse_sticks.svg/2000px-Crossed_lacrosse_sticks.svg.png",
      running: "http://www.freeiconspng.com/uploads/running-shoes-3.png",
      swimming: "http://www.freeiconspng.com/uploads/swimming-pool--2.png",
      cycling: "https://d30y9cdsu7xlg0.cloudfront.net/png/536-200.png",
      chess: "http://www.iconsfind.com/wp-content/uploads/2015/11/20151106_563c235abcd0c.png",
      basketball: "http://downloadicons.net/sites/default/files/basketball-icon-86027.png"
    }.with_indifferent_access

    image_tag(sports[sport_name], style: 'width: 15px;height:15px;', data:{toggle:"tooltip", placement: "top", title: sport_name})
  end

end
