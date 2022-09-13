json.inserted_item render(partial: "events/heart", formats: :html, locals: {favorited: current_user.favorited?(@event)})
