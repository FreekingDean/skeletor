class ScopedResourceController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    self.instance_variable_set("@#{self.resource_name}", current_account.send(:"#{self.resource_name}"))
    call_before_render_hooks
  end

  def new
    self.instance_variable_set(
      "@#{self.resource_name.singularize}",
      current_account.send(:"#{self.resource_name}").build
    )

    call_before_render_hooks
  end

  def show
    call_before_render_hooks
  end

  def edit
    call_before_render_hooks
  end

  def create
    resource = current_account.send(:"#{self.resource_name}").build(
      self.send(:"#{self.resource_name.singularize}_params")
    )

    if resource.save
      redirect_to resource
    else
      self.instance_variable_set("@#{self.resource_name.singularize}", resource)
      flash[:error] = resource.errors.full_messages
      call_before_render_hooks
      render :new
    end
  end

  def update
    if @resource.update(self.send(:"#{self.resource_name.singularize}_params"))
      redirect_to @resource
    else
      call_before_render_hooks
      render :edit
    end
  end

  def destroy
    @resource.destroy
    call_before_render_hooks
    redirect_to action: :index
  end

  def resource_name
    self.class.resource_name
  end

  def self.resource_name
    raise NotImplemented
  end

  def self.before_render(method_name, only: false, except: false)
    self.before_render_hooks[method_name.to_sym] = {only: only, except: except}
  end

  def self.before_render_hooks
    @before_render_hooks ||= {}
  end

  protected

  def call_before_render_hooks
    self.class.before_render_hooks.each do |method_name, hook|
      return if hook[:only] && !hook[:only].include?(action_name.to_sym)
      return if hook[:except] && !hook[:except].include?(action_name.to_sym)
      self.send(method_name)
    end
  end

  def set_resource
    @resource = current_account.send(:"#{self.resource_name}")

    if self.resource_name != self.resource_name.singularize
      @resource = @resource.find(params[:id])
    end

    self.instance_variable_set(
      "@#{self.resource_name.singularize}",
      @resource
    )
  end
end
