from django.forms import fields, ModelForm, widgets

from .models import ExpendUser, StudentInfo


class RegisterForm(ModelForm):
    re_password = fields.CharField(max_length=20, required=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})

    class Meta:
        model = ExpendUser
        fields = ['username', 'email', 'phone', 'password', 're_password']


class StudentMsgForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})

    class Meta:
        model = StudentInfo
        fields = ['student_name', 'institute', 'profession', 'avatar', 'school']

        widgets = {
            'avatar': widgets.FileInput(),

        }
