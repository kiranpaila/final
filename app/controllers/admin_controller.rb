class AdminController < ApplicationController
  def home


  end






  def adduser

    if request.method=="GET"

      printnav()


    else
      em=[]
      p=params[:pass]
      cp=params[:cpass]
      n=params[:name]

      if(not p==cp )
        em.push 'Password is not Same.'
        session[:em]=em
        redirect_to action:adduser
      else
        userd=User.new(name:n,password:p)
        userd.save


        redirect_to action:"dashboard"


      end


    end


  end

  def edituserdetails

    @usr=User.find(params[:id])

    if(request.method=="GET")
      printnav()



    else
      @usr.destroy


      em=[]
      p=params[:pass]
      cp=params[:cpass]
      n=params[:name]

      if(not p==cp )
        em.push 'Password is not Same.'
        session[:em]=ems
        redirect_to action:adduserdetails
      else
        userd=User.new(name:n,password:p)
        userd.save
        redirect_to action:"edituser"


      end




    end
  end
  def logout
    session[:userdetails]=nil

    redirect_to controller:"sessions" ,action:"new"

  end
  def edituser

    printnav()

    @us=User.all


  end
  def deleteuser
    printnav()

    @u=User.find(params[:id])
    @u.destroy

    redirect_to action:"edituser"

  end

  def funds
    printnav()



  end
  def registration
    printnav()



  end
  def news
    printnav()



  end

  def feedback
    printnav()



  end
  def registrationfee
    printnav()



  end

  def expenditures
    printnav()



  end
  def sponsorships
    printnav()



  end


end
