class UserPolicy
    attr_reader :user, :localUser
    def initialize(user, localUser)
      @user = user
      @localUser = localUser
    end

    def index?
        validateLocalUser
    end

    def list?
        validateLocalUser
    end

    def show?
        validateLocalUser
    end

    def new?
        validateLocalUser
    end

    def create?
        validateLocalUser
    end

    def edit?
        validateLocalUser
    end

    def update?
        validateLocalUser
    end

    def destroy?
        validateLocalUser
    end

    private def validateLocalUser
        user.present? and user.admin?
    end
end