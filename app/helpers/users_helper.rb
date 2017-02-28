module UsersHelper

  def sport_icon(sport_name)
    #TODO real icon sets not remote image hacks :(
    sports = {
      rowing: "https://www.iconshock.com/img_vista/IPHONE/transportation/jpg/row_boat_icon.jpg",
      soccer: "https://image.flaticon.com/icons/svg/53/53283.svg",
      football: "https://www.iconexperience.com/_img/i_collection_png/512x512/plain/football.png",
      baseball: "https://d30y9cdsu7xlg0.cloudfront.net/png/561-200.png",
      lacrosse: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Crossed_lacrosse_sticks.svg/2000px-Crossed_lacrosse_sticks.svg.png",
      running: "https://d30y9cdsu7xlg0.cloudfront.net/png/72758-200.png",
      swimming: "https://image.freepik.com/free-icon/silhouette-of-a-swimming-person-on-a-wave_318-27333.jpg",
      cycling: "https://d30y9cdsu7xlg0.cloudfront.net/png/536-200.png",
      chess: "https://www.iconsfind.com/wp-content/uploads/2015/11/20151106_563c235abcd0c.png",
      basketball: "https://d30y9cdsu7xlg0.cloudfront.net/png/106597-200.png"
    }.with_indifferent_access

    image_tag(sports[sport_name], style: 'width: 15px;height:15px;', data:{toggle:"tooltip", placement: "top", title: sport_name})
  end

end
