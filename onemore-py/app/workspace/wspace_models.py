from dataclasses import dataclass

from marshmallow import Schema, fields

from server import db


@dataclass
class Workspace(db.Model):
    __tablename__ = "workspace"
    id = db.Column(db.Integer, primary_key=True)
    workspace_name = db.Column(db.String(150), nullable=False)
    description = db.Column(db.String(500), nullable=True)
    user = db.Column(db.String(10), db.ForeignKey("users.id"), nullable=False)

    def __init__(self, **kwargs):
        """
        The function takes in a dictionary of keyword arguments and assigns the values to the class
        attributes
        """
        self.workspace_name = kwargs.get("workspace_name")
        self.description = kwargs.get("description")
        self.user = kwargs.get("user")

    def __repr__(self):
        """
        The __repr__ function is used to return a string representation of the object
        :return: The username of the user.
        """
        return "<Workspace {}>".format(self.workspace_name)


class WorkspaceSchema(Schema):
    id = fields.Str()
    workspace_name = fields.Str()
    description = fields.Str()
    user = fields.Str()
