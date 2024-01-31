from flask import(
    Blueprint, flash, g , redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort
from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint("activity_log", __name__)

@bp.route("/")
def index():
    db = get_db()
    activities = db.execute(
        "SELECT log_id, title, activity_description, start_time, end_time, category"
        " FROM activity_log a JOIN users u ON a.user_id = u.user_id"
        " ORDER BY created DESC"
    ).fetchall()
    return render_template("blog/index.html", activities=activities)