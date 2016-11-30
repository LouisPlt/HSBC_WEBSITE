ActiveAdmin.register Transfer do

  permit_params :amount, :description, :receiver_account_id, :sender_account_id

  index do
    id_column
    column 'Receiver' do |resource|
      link_to(resource.receiver_account, admin_account_path(resource.receiver_account))
    end
    column 'Sender' do |resource|
      link_to(resource.sender_account, admin_account_path(resource.sender_account))
    end
    column :amount


  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :amount
      f.input :description
      f.input :sender_account_id, as: :select, collection: account_collection, required: true
      f.input :receiver_account_id, as: :select, collection: account_collection, required: true
    end
    actions
  end

  show do |transaction|
    panel "Transation" do
      attributes_table_for transaction do
        row 'Receiver' do |resource|
          link_to resource.receiver_account.client.full_name, admin_client_path(resource)
        end
        row 'Sender' do |resource|
          link_to resource.sender_account.client.full_name, admin_client_path(resource)
        end
        row :amount
        row :description
      end
    end
  end
end
