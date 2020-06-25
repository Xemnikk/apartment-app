class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get '/tenants' do
    @tenant = Tenant.all
    erb :tenant
  end

  get '/new-tenant' do
    erb :new_tenant
  end

  post '/new-tenant' do
    @new_tenant = Tenant.create({
      name: params[:name]
    })
    redirect('/tenants')
  end

  get '/tenant/:id' do
    @tenant = Tenant.find(params[:id])
    @apartments = Apartment.all
    @apt_boys = @apartments.select do |y|
      y.id == @tenant.apartment_id
    end
    erb :edit_tenant
  end

  patch('/tenant/:id') do
    tenant = Tenant.find(params[:id])
    tenant.name = params[:name]
    tenant.save
    redirect("/tenant/#{tenant.id}")
  end

  patch('/tenant/:id') do 
    tenant = Tenant.find(params[:id])
    apartment = Apartment.find(params[:id])
    apartment.address = params[:address]
    apartment.save
    redirect("/tenant/#{tenant.id}")
  end

  delete('/remove/:id') do
    tenant = Tenant.find(params[:id])
    tenant.destroy()
    redirect('/tenants')
  end 

  post '/tenant/:id' do
    
  end
  
  get '/apartments' do
    @apartment = Apartment.all
    erb :apartment
  end
  
  get '/new-apartment' do
    erb :new_apartment
  end

  post '/new-apartment' do
    @new_apartment = Apartment.create({
      address: params[:address]
    })
    redirect('/apartments')
  end

  get '/apartment/:id' do
    @apartment = Apartment.find( params[:id] )
    @tenants = Tenant.all
    @tenant_peeps = @tenants.select do |t|
      t.apartment_id == @apartment.id
    end
    erb :id_apart
  end

  delete('/remove/:id') do
    apartment = Apartment.find(params[:id])
    apartment.destroy()
    redirect('/apartments')
  end


end
