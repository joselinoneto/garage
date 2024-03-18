class ProductPolicy
    attr_reader :user, :product
    def initialize(user, product)
      @user = user
      @product = product
    end

    def show?
        product.published or validateUser
    end

    def new?
        validateUser
    end

    def create?
        validateUser
    end

    def edit?
        validateUser
    end

    def update?
        validateUser
    end

    def destroy?
        validateUser
    end

    private def validateUser
        user.present? and user.admin?
    end
end